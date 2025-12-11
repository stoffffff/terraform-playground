resource "aws_kinesis_stream" "roa" {
  name             = "RodOfAges-stream"
  shard_count = 1

  tags = {
    Lan = "Midlane"
  }
}