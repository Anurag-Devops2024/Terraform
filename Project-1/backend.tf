terraform {
  backend "s3" {
    bucket = "devops2024terraform"
    key = "terraform/state/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}