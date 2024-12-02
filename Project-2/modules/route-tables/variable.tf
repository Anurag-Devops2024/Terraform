variable "route_table_name" {
  type = string
}

variable "vpc_id" {
  default = ""
  type = string
}

variable "ig_id" {
  default = ""
  type = string
}

variable "public_subnet_cidrs" {
  default = []
  type = list(string)
}

variable "public_subnet_name" {
  default = ""
  type = string
}