variable "route-table-name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet" {
    default = []
  type = list(string)
}

variable "multiple_routes" {
  type = list(object({
    cidr_block = string 
    internet_gateway = string
  }))
}
