provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2_instance_1" {
    ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.Name
  }
}

resource "aws_s3_bucket" "devops_s3_Bucket" {
  bucket = var.s3_bucket_Name
}