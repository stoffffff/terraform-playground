resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "champions-stats"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "champion_id"

    attribute {
    name = "champion-id"
    type = "N"
  }
  }
