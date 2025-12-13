# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-7ddfb758af3c946f8"
  vpc_security_group_ids = [
    "sg-2d397d7342ce1c340"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "xfusion-ec2-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2-ip.id
}