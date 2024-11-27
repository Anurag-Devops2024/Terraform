variable "ami" {
    default = "ami-0866a3c8686eaeeba"
    type = string
    description = "AMI Value"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
    description = "Instance Type"
}

variable "Name" {
    default = "Devops_2024"
    type = string
    description = "Name Value"
}

variable "s3_bucket_Name" {
  default = "devopsterraform2024demo"
  type = string
  description = "S3 Bucket For Terraform"
}