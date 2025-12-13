# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-f5f1fb8522dc6a1f6"
  ]

  tags = {
    Name = "datacenter-ec2"
  }
}

resource "null_resource" "terminate_ec2" {
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids i-8b52b199028dee485"
  }
}

