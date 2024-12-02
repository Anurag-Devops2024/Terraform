variable "public_subnet_cidrs" {
  type = list(string)
}

variable "securitygroup_name" {
  type = string
}

variable "vpc_id" {
  default = ""
  type = string
}