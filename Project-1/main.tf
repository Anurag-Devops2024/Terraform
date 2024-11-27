provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instance_1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.devopssubnet.id

  tags = {
    Name = var.Name
  }
}

resource "aws_s3_bucket" "devops_s3_Bucket" {
  bucket = var.s3_bucket_Name
}

# VPC Creation
resource "aws_vpc" "devopsvpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devopsvpc"
  }

}

#Security Groups

resource "aws_security_group" "devopssecuritygroup" {
  name = "allow_devops_traffic"
  description = "Allow Devops inbound and outbound traffic"
  vpc_id = aws_vpc.devopsvpc.id

  tags = {
    Name = "Allow Devops Traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.devopssecuritygroup.id
  cidr_ipv4         = aws_vpc.devopsvpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
   security_group_id = aws_security_group.devopssecuritygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}