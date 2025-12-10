# Generate your key pair first!
resource "aws_key_pair" "key" {
  key_name   = "void-grubs"
  public_key = file("key.pub")
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

#Get default SG
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_instance" "vm" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.key_name
  tags = {
    Name = "rift-herald"
  }
  vpc_security_group_ids = [
    data.aws_security_group.default.id
  ]
}
