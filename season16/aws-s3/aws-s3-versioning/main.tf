resource "aws_s3_bucket" "s3_ranked_bucket" {
  bucket = "xfusion-s3-22445"
  acl    = "private"

  tags = {
    Name        = "xfusion-s3-22445"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_ranked_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}