resource "aws_ssm_parameter" "ssm-param" {
  name  = "xayah-ssm-parameter"
  type  = "String"
  value = "xayah-value"
}