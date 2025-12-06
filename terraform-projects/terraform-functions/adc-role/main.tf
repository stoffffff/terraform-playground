resource "aws_instance" "botlane" {
  ami = var.ami
  tags = {
    Name = var.name
  }
  instance_type = var.name == "poro" ? var.small : var.large
}
