variable "data" {
  default = {
    admin = "This is a password lol"
  }

  type = map(string)
}

resource "aws_secretsmanager_secret_version" "secret-version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(var.data)
}
resource "aws_secretsmanager_secret" "secret" {
  name = "devops-secret"
}