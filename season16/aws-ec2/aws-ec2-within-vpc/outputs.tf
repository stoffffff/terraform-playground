output "KKE_vpc_name" {
  value = aws_vpc.galio.tags["Name"]
}

output "KKE_subnet_name" {
  value = aws_subnet.kassadin.tags["Name"]
}

output "KKE_ec2_private" {
  value = aws_instance.ziggs.tags["Name"]
}
