variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
}

variable "public_subnet_name" {
  type = string
}
variable "private_subnet_name" {
  type = string
}
variable "vpc_id" {
  default = ""
  type = string
}