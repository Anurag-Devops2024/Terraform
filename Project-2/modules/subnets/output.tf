output "private_subnet_name" {
  description = ""
  value = aws_subnet.private_subnet_name[*].id
}

output "public_subnet_cidr" {
  value = aws_subnet.public_subnet_name[*].cidr_block
}