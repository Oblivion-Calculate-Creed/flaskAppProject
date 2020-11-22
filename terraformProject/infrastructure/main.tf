provider "aws"  {
    region = "eu-west-1"
    shared_credentials_file     = "~/.aws/credentials"
}

module "ec2_module" {
    source                      = "./ec2"
    subnet_id                   = module.vpc_module.subnet_A_id
    vpc_id                      = module.vpc_module.vpc_id
    associate_public_ip_address = true
}

module "rds_module" {
    source                      = "./rds"
    subnet_A_id                 = module.vpc_module.subnet_A_id
    subnet_B_id                 = module.vpc_module.subnet_B_id
    security_group_A_id         = module.ec2_module.security_group_id                
}

module "vpc_module" {
    source                      = "./vpc"
}

module "kc_module" {
    source                      = "./kc"
    eks_sg_id                   = module.ec2_module.security_group_id
    eks_sn_id_sub_A             = module.vpc_module.subnet_A_id
    eks_sn_id_sub_B             = module.vpc_module.subnet_B_id
}