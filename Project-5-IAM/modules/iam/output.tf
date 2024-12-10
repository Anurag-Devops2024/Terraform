output "secret_key" {
  value = aws_iam_access_key.Devops.secret
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}
