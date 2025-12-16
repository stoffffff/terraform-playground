output "vpc_name" {
  value = aws_vpc.botlane.tags.Name
}

output "subnet_name" {
  value = aws_subnet.main.tags.Name
}
