# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "VPC IGW - ${var.env}"
  }
}
