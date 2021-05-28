output "subnet_id_public_1" {
  value = aws_subnet.public_1.id

  depends_on = [
    aws_subnet.public_1,
    aws_subnet.public_2
  ]
}

output "subnet_id_public_2" {
  value = aws_subnet.public_2.id

  depends_on = [
    aws_subnet.public_1,
    aws_subnet.public_2
  ]
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
