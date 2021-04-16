# Define the public subnet
resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1a
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.env}:public:1a"
  }
}
resource "aws_subnet" "public-subnet-1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1b
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.env}:public:1b"
  }
}

resource "aws_subnet" "public-subnet-1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1c
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.env}:public:1c"
  }
}

resource "aws_subnet" "public-subnet-1d" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1d
  availability_zone = "us-east-1d"

  tags = {
    Name = "${var.env}:public:1d"
  }
}

resource "aws_subnet" "public-subnet-1e" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1e
  availability_zone = "us-east-1e"

  tags = {
    Name = "${var.env}:public:1e"
  }
}

resource "aws_subnet" "public-subnet-1f" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr-1f
  availability_zone = "us-east-1f"

  tags = {
    Name = "${var.env}:public:1f"
  }
}

# Define the private subnet


resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr-1a
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.env}:priv:1a"
  }
}
resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr-1b
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.env}:priv:1b"
  }
}

resource "aws_subnet" "private-subnet-1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr-1c
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.env}:priv:1c"
  }
}

resource "aws_subnet" "private-subnet-1d" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr-1d
  availability_zone = "us-east-1d"

  tags = {
    Name = "${var.env}:priv:1d"
  }
}

resource "aws_db_subnet_group" "private" {
  name       = "subnet-group-priv-db"
  subnet_ids = ["${aws_subnet.private-subnet-1a.id}", "${aws_subnet.private-subnet-1b.id}", "${aws_subnet.private-subnet-1c.id}", "${aws_subnet.private-subnet-1d.id}"]
  tags = {
    Name = "${var.account_name}-priv-db"
  }
}
