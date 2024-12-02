resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ig_id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Route Table Association
resource "aws_route_table_association" "public_subnet_association" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = var.public_subnet_cidrs[count.index]
 route_table_id = aws_route_table.route_table.id
}