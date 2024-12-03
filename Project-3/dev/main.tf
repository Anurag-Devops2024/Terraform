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

module "internet_gateway" {
  source = "../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  ig_name = "devops-2024-ig"
}

module "route_table" {
  source = "../modules/route-table"
  route-table-name = "devops-2024-routetable"
  vpc_id = module.vpc.vpc_id
  multiple_routes = [
  { cidr_block = "10.10.1.0/24", internet_gateway = module.internet_gateway.ig-id },
  { cidr_block = "10.10.2.0/24", internet_gateway = module.internet_gateway.ig-id }
  ]
  
}

module "security_group" {
  source = "../modules/security-groups"
  sg_name = "devops-2024-security-group"
  vpc_id = module.vpc.vpc_id
  public_cidr_block= module.subnets.public_subnet_cidrs
}

module "instance" {
  source = "../modules/ec2"
  name = "webserver-1"
  subnet_id = module.subnets.private_subnet_id[1]
}

module "s3" {
  source = "../modules/s3"
  bucket_name = "devops-2024-terraform-project3"
}
