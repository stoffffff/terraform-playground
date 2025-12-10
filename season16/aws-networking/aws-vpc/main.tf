resource "aws_vpc" "botlane" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "botlane-vpc"
  }
}
