variable "vpc_name" {
  type = string
}

variable "cidr_block" {
  default = ""
  type = string
}

# variable "public_subnet_cidrs" {
#   type = list(string)
# }

# variable "private_subnet_cidrs" {
#   type = list(string)
# }