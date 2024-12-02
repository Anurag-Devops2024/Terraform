provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../modules/vpc"
  vpc_name = "devopsvpc24"
  cidr_block = "10.0.0.0/16"
}

module "internet_gateway" {
  source = "../modules/internet-gateway"
  ig_name = "devopsinternetgateway"
  vpc_id = module.vpc.vpc_id
}

module "route_tables" {
  source = "../modules/route-tables"
  route_table_name = "devopsroutetable"
  vpc_id = module.vpc.vpc_id
  ig_id = module.internet_gateway.ig_id
}



module "subnet" {
  source = "../modules/subnets"
  public_subnet_name = "devopspublicsubnet"
  private_subnet_name = "devopsprivatesubnet"
  public_subnet_cidrs = ["10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24","10.0.12.0/24"]
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "../modules/security-groups"
  securitygroup_name = "devopssecuritygroupterraform"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidrs = module.subnet.public_subnet_cidr
}

module "instance" {
  source = "../modules/ec2"
  name = "webserver-1"
  subnet_id = "${element(module.subnet.private_subnet_name,0)}"
}

module "s3_bucket" {
  source = "../modules/s3"
  bucket_name = "devopss3bucketterraform"
}

