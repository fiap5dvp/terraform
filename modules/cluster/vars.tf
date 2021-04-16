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

data "aws_iam_policy_document" "autoscaling_policy_doc" {
  statement {
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions"
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

variable "cluster_name" {
  type        = string
  description = "Cluster Name was created"
}

variable "cluster_version" {
  type        = string
  description = "Cluster Version"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name that the cluster that will be created"
}
variable "public_subnet_cidr_master" {
  type        = string
  description = "Core network CIDR block"
}
variable "public_subnet_cidr_slave" {
  type        = string
  description = "Secondy network CIDR block"
}
