output "vpc_id" {
  value = aws_vpc.devops_vpc.id
}

# output "private_subnet_name" {
#   description = ""
 
#   value = aws_subnet.private_subnet[*].id
# }