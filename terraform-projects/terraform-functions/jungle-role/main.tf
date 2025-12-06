# floor(5.7) -> 5 -- Returns the first whole number less than the argument
# lookup() -> works with maps
# title(This-is a string) = This-Is A String -- Converts first char in strings to capital letter

resource "aws_iam_user" "cloud" {
     name = split(":",var.cloud_users)[count.index]
     count = length(split(":",var.cloud_users))
  
}
resource "aws_s3_bucket" "sonic_media" {
     bucket = var.bucket
  
}
resource "aws_s3_object" "upload_sonic_media" {
  bucket = aws_s3_bucket.sonic_media.id
  for_each = var.media
  source = each.value
  key = substr(each.value,7,20) 
}

