resource "aws_s3_bucket" "fizz" {
  bucket = "datacenter-s3-5475"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.fizz.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.fizz.id
  acl    = "private"
}