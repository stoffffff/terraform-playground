resource "aws_s3_bucket_object" "upload" {
  bucket = "midlane-champions"
  key    = "leblanc.jpg"
  source = "/root/leblanc.jpg"

}