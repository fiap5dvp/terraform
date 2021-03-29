data "aws_vpc" "vpc_name" {
  filter {
    name   = "tag:Name"
    values = ["*${var.vpc_name}*"]
  }
}

data "aws_route_table" "rts" {
  vpc_id = data.aws_vpc.vpc_name.id

  filter {
    name   = "tag:Name"
    values = ["*${var.routetable_name}*"]
  }
}

variable "cluster_log_types" {
  type    = list(any)
  default = ["scheduler", "controllerManager", "audit", "api", "authenticator"]
}

variable "routetable_name" {
  type    = string
  default = "Default Public"
}

variable "availability_zone_master" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_slave" {
  type    = string
  default = "us-east-1b"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}


variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_name" {}
variable "public_subnet_cidr_master" {}
variable "public_subnet_cidr_slave" {}
