resource "aws_iam_user" "user" {
  name = "Devops"
}

resource "aws_iam_access_key" "Devops" {
  user = aws_iam_user.user.name
}


output "access_key" {
  value = aws_iam_access_key.Devops.id
}



resource "aws_iam_user_policy" "lb_ro" {
  name = "devops_ec2_policy"
  user = aws_iam_user.user.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}




#Role Creation
resource "aws_iam_role" "role" {
  name = "devops-2024"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "role_attachement" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-profile"
  role = aws_iam_role.role.name
}
