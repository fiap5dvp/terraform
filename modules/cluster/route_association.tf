resource "aws_route_table_association" "subnet-association-master" {
  route_table_id = data.aws_route_table.rts.route_table_id
  subnet_id      = aws_subnet.subnet-master.id
}

resource "aws_route_table_association" "subnet-association-slave" {
  route_table_id = data.aws_route_table.rts.route_table_id
  subnet_id      = aws_subnet.subnet-slave.id
}
