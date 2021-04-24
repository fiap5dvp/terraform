resource "aws_subnet" "public_1" {
  vpc_id            = join("", aws_vpc.vpc.*.id)
  cidr_block        = var.public_cidr_1
  availability_zone = var.public_az_1
}


resource "aws_subnet" "public_2" {
  vpc_id            = join("", aws_vpc.vpc.*.id)
  cidr_block        = var.public_cidr_2
  availability_zone = var.public_az_2
}
