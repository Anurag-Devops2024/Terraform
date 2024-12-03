provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../modules/vpc"
  vpc_name = "vpc_devops"
  vpc_cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_name = "dev-public-subnet"
  public_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
  private_subnet_name = "dev-private-subnet"
  private_subnet_cidrs = ["10.0.100.0/24","10.0.200.0/24"]
}

module "s3" {
  source = "../modules/s3"
  bucket_name = "devops-2024-terraform-project3"
}
