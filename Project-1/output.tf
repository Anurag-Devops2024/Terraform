output "instance_name" {
    value = aws_instance.ec2_instance_1
}

output "ami" {
    value = aws_instance.ec2_instance_1.ami
}

output "aws_s3_bucket" {
    value = aws_s3_bucket.devops_s3_Bucket.acl
}