resource "aws_s3_bucket" "my_bucket" {
  bucket = "aram-cp-23671"
  acl    = "private"

  tags = {
    Name = "aram-cp-23671"
  }
}

resource "null_resource" "copy_file" {
  provisioner "local-exec" {
    command = "aws s3 cp /tmp/aram.txt s3://aram-cp-23671/aram.txt"
  }
}