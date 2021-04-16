# Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Public Subnet RT"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.nat1.id
  }
  tags = {
    Name = "private Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-1a-rt" {
  subnet_id      = element(list(aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id, aws_subnet.public-subnet-1c.id, aws_subnet.public-subnet-1d.id, aws_subnet.public-subnet-1e.id, aws_subnet.public-subnet-1f.id), count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-rt" {
  subnet_id      = element(list(aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1b.id, aws_subnet.private-subnet-1c.id, aws_subnet.private-subnet-1d.id), count.index)
  route_table_id = aws_route_table.private-rt.id
}
