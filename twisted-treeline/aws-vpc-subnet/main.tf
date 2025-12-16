resource "aws_vpc" "botlane" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.VPC_NAME
  }
}

resource "aws_subnet" "botlane" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.SUBNET_NAME
  }
  depends_on = [aws_vpc.botlane]
}