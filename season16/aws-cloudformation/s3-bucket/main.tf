resource "aws_cloudformation_stack" "cf_stack" {
  name = "sr-stack"

  template_body = <<EOF
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "CloudFormation stack created via Terraform",
  "Resources": {
    "srBucket": {
      "Type": "AWS::S3::Bucket",
      "Properties": {
        "BucketName": "sr-bucket-15378",
        "VersioningConfiguration": {
          "Status": "Enabled"
        }
      }
    }
  }
}
EOF
}
