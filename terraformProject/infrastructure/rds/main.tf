resource "aws_db_subnet_group" "rds_subnet" {
    name                    = "rds_subnet_group"
    subnet_ids              = [var.subnet_A_id, var.subnet_B_id]
}

resource "aws_db_instance" "initial_db"    {
    allocated_storage       = 20
    storage_type            = "gp2"
    engine                  = "mysql"
    engine_version          = "5.7"
    instance_class          = "db.t2.micro"
    name                    = "initial_db"
    username                = "root"
    password                = "passmaxsecure"
    parameter_group_name    = "default.mysql5.7"
    db_subnet_group_name    = aws_db_subnet_group.rds_subnet.name
    vpc_security_group_ids  = [var.security_group_A_id]
}

resource "aws_db_instance" "test_db"    {
    allocated_storage       = 20
    storage_type            = "gp2"
    engine                  = "mysql"
    engine_version          = "5.7"
    instance_class          = "db.t2.micro"
    name                    = "initial_db"
    username                = "root"
    password                = "passmaxsecure"
    parameter_group_name    = "default.mysql5.7"
    db_subnet_group_name    = aws_db_subnet_group.rds_subnet.name
    vpc_security_group_ids  = [var.security_group_A_id]
}
