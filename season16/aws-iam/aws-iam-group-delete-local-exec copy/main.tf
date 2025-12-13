resource "aws_iam_role" "role" {
  name = "iamrole_kareem"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "iamrole_kareem"
  }
}

resource "null_resource" "delete_iam_role" {
  provisioner "local-exec" {
    command = "aws iam delete-role --role-name"
  }
}