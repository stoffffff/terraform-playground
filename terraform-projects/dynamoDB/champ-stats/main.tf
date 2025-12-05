resource "aws_dynamodb_table" "champion_select" {
  name         = "champions"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ChampID"

  attribute {
    name = "ChampID"
    type = "N"
  }
  attribute {
    name = "ChampionName"
    type = "S"
  }
  attribute {
    name = "Role"
    type = "S"
  }
  attribute {
    name = "Power"
    type = "S"
  }
  global_secondary_index {
    name            = "ChampionName"
    hash_key        = "ChampionName"
    projection_type = "ALL"

  }
  global_secondary_index {
    name            = "Role"
    hash_key        = "Role"
    projection_type = "ALL"

  }
  global_secondary_index {
    name            = "Power"
    hash_key        = "Power"
    projection_type = "ALL"

  }
}

resource "aws_dynamodb_table_item" "upload" {
  table_name = aws_dynamodb_table.champion_select.name
  hash_key   = aws_dynamodb_table.champion_select.hash_key
  item = <<EOF
  {

    "ChampID" : { "N" : "1" },

    "ChampionName" : { "S" : "Garen" },

    "Role" : { "S" : "Top" },

    "Power" : { "S" : "AD" }

  }
  EOF
}
