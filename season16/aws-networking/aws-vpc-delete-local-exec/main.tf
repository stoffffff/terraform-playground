resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "rift-vpc"
  }
}

resource "null_resource" "delete_vpc" {
  provisioner "local-exec" {
    command = "aws ec2 delete-vpc --vpc-id 'YOUR_VPC_ID'"
  }
}