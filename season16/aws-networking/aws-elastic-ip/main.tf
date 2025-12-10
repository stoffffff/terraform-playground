resource "aws_eip" "midlane"{
    domain = "vpc"
    tags = {
        Name = "${var.champName}"
    }
}