variable "ami" {
    default = "ami-830c94e3"
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
  default = "devops_terraform"
  type = string
  description = "S3 Bucket For Terraform"
}