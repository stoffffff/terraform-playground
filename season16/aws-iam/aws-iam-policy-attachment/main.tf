# Create IAM user
resource "aws_iam_user" "user" {
  name = "player"

  tags = {
    Name = "player-adc"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "player-policy"
  description = "IAM policy allowing EC2 read actions for player-adc"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}

# Attach the policy to the user
resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}