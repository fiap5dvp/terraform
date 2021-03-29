resource "aws_subnet" "subnet-master" {
  vpc_id            = data.aws_vpc.vpc_name.id
  cidr_block        = var.public_subnet_cidr_master
  availability_zone = var.availability_zone_master

  tags = {
    Name = "${var.cluster_name}-${var.availability_zone_master}"
  }
}

resource "aws_subnet" "subnet-slave" {
  vpc_id            = data.aws_vpc.vpc_name.id
  cidr_block        = var.public_subnet_cidr_slave
  availability_zone = var.availability_zone_slave

  tags = {
    Name = "${var.cluster_name}-${var.availability_zone_slave}"
  }
}
