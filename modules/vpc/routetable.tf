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

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-rt_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public-rt.id
}
