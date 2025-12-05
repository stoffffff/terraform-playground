resource "aws_dynamodb_table" "player_data" {
  name           = "player_data"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "PlayerId"

  attribute {
    name = "PlayerId"
    type = "N"
  }
}
