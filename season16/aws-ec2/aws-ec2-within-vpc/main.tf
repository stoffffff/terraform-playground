#VPC
resource "aws_vpc" "galio" {
  cidr_block       = var.KKE_VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "xfusion-priv-vpc"
  }
}

#SUBNET
resource "aws_subnet" "kassadin" {
  vpc_id     = aws_vpc.galio.id
  cidr_block = var.KKE_SUBNET_CIDR

  tags = {
    Name = "xfusion-priv-subnet"
  }
}

#EC2 instance
resource "aws_instance" "ziggs" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"
  tags = {
    Name = "xfusion-priv-ec2"
  }
  subnet_id              = aws_subnet.kassadin.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}

# SECURITY GROUP
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.galio.id

  tags = {
    Name = "allow_tls"
  }
}

#Allow all traffic IPV4 within the VPC
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.KKE_VPC_CIDR
  ip_protocol       = "-1" # semantically equivalent to all ports
}
