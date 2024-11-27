resource "aws_subnet" "devopssubnet" {
  vpc_id = aws_vpc.devopsvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devopsvpc.id

  tags = {
    Name = "IGW"
  }
}

# Route Table

resource "aws_route_table" "devopsroutetable" {
  vpc_id = aws_vpc.devopsvpc.id

  tags = {
    Name = "DevopsRoutetable"
  }
}

# Route Table Association

resource "aws_route_table_association" "devopsroutetableassociation" {
  subnet_id = aws_subnet.devopssubnet.id
  route_table_id = aws_route_table.devopsroutetable.id
}