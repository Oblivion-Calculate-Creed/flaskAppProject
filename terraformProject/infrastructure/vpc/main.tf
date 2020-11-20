resource "aws_vpc" "initial_vpc" {
cidr_block          = var.vpc_cidr_block
instance_tenancy    = "default" 
}

resource "aws_subnet" "subnet_A" {
vpc_id              = aws_vpc.initial_vpc.id
cidr_block          = var.subnet_A_cidr_block
availability_zone   = "eu-west-1b"
}

resource "aws_subnet" "subnet_B" {
vpc_id              = aws_vpc.initial_vpc.id
cidr_block          = var.subnet_B_cidr_block
availability_zone   = "eu-west-1a"
}

resource "aws_internet_gateway" "internet_gw" {
vpc_id              = aws_vpc.initial_vpc.id
}

resource "aws_route_table" "route_table" {
vpc_id              = aws_vpc.initial_vpc.id

    route {
        cidr_block  = "0.0.0.0/0"
        gateway_id  = aws_internet_gateway.internet_gw.id
    }
}

resource "aws_route_table_association" "subnet_A_association" {
    depends_on      = [
        aws_subnet.subnet_A
    ]
    subnet_id       = aws_subnet.subnet_A.id
    route_table_id  = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet_B_association" {
    depends_on      = [
        aws_subnet.subnet_B
    ]
    subnet_id       = aws_subnet.subnet_B.id
    route_table_id  = aws_route_table.route_table.id
}

resource "aws_main_route_table_association" "vpc_association" {
  vpc_id            = aws_vpc.initial_vpc.id
  route_table_id    = aws_route_table.route_table.id
}