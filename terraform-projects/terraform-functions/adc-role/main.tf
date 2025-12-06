resource "aws_instance" "botlane" {
  ami = var.ami
  tags = {
    name = var.name
  }
  instance_type = var.name == "poro" ? var.small : var.large
}
