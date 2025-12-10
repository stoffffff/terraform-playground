resource "aws_iam_policy" "policy" {
  name        = "botlane-policy"
  description = "Jungler can only come to botlane to ward pre minute 10"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeImages",
          "ec2:DescribeSnapshots",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeRegions",
          "ec2:DescribeTags"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}