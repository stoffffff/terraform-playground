resource "aws_cloudwatch_log_group" "summoner's-rift" {
  name = "sr-log-group"
}

resource "aws_cloudwatch_log_stream" "foo" {
  name           = "sr-normal-stream"
  log_group_name = aws_cloudwatch_log_group.yada.name
}