resource "aws_vpc" "devops_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# resource "aws_subnet" "public_subnet" {
#   count = length(var.public_subnet_cidrs)
#   vpc_id = aws_vpc.devops_vpc.id
#   cidr_block = var.public_subnet_cidrs[count.index]

#   tags = {
#     Name = "${var.vpc_name}-public-${count.index}"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   count = length(var.private_subnet_cidrs)
#   vpc_id = aws_vpc.devops_vpc.id
#   cidr_block = var.private_subnet_cidrs[count.index]

#   tags = {
#     Name = "${var.vpc_name}-private-${count.index}"
#   }
# }

# resource "aws_internet_gateway" "ig" {
#   vpc_id = aws_vpc.devops_vpc.id

#   tags = {
#     Name = "${var.vpc_name}-ig"
#   }
# }

# resource "aws_route_table" "public_ig" {
#   vpc_id = aws_vpc.devops_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.ig.id
#   }

#   tags = {
#     Name = "${var.vpc_name}-route-table"
#   }
# }

# resource "aws_route_table_association" "name" {
#   count = length(var.public_subnet_cidrs)
#   subnet_id = aws_subnet.public_subnet[count.index].id
#   route_table_id = aws_route_table.public_ig.id
# }