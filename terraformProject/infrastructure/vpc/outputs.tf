output "vpc_id" {
  value = aws_vpc.initial_vpc.id
}

output "subnet_A_id" {
  value = aws_subnet.subnet_A.id
}

output "subnet_B_id" {
  value = aws_subnet.subnet_B.id
}