resource "aws_security_group" "security_group_A" {
  description       = "Allow inbound traffic"
  vpc_id            = var.vpc_id

  dynamic "ingress" {
    iterator        = port
    for_each        = var.ingress_ports
    content {
      from_port     = port.value
      protocol      = "tcp"
      to_port       = port.value
      cidr_blocks   = var.open_internet
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.open_internet
  }
}

resource "aws_key_pair" "my_key_pair" {
  key_name          = "my_key_pair"
  public_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxPzgN7RZ/yYfiO+07tVXFBJERj/ixV/gEnSzANnyCJw9Y4KNyg5pVT7auTeqIeRwhOmeIVU2Y6xrKSnow3EoAq3aX8DJ9NR6bNwq1hsIXxiX1LWT5MLLiR/NXQth5NZEoiieKzWi6ap/apwGI5We+72cshzgpuQJtqabjQkye2YnRmtpsuR/u8A87wC5noDDN9Ax8kx7xrOdZpn39iVUcoEr6Vg9B8Ih2QQ+TrITE/LAyTC8xI6+9X8GI9zNu/0ari9A1RdvrLaDRQgUuy7yP6KPchEOpqlEkyp9r5Y5liNQBc4nP4/SEEkbt433fIBX0AkUyvuRLL+nTd6u31a0H ubuntu@ip-172-31-36-221"
}

resource "aws_instance" "jenkins" {
  ami               = var.ami
  tags              = {
    Name = var.instance_name
  }
  instance_type                 = var.instance_type
  key_name                      = aws_key_pair.my_key_pair.key_name
  subnet_id                     = var.subnet_id
  vpc_security_group_ids        = [aws_security_group.security_group_A.id]

  lifecycle {
    create_before_destroy       = true
  }
  associate_public_ip_address = var.associate_public_ip_address
}