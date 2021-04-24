data "aws_vpc" "vpc_id"{
  id = var.vpc_id
}

variable "cluster_log_types" {
  type    = list(any)
  default = ["scheduler", "controllerManager", "audit", "api", "authenticator"]
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

variable "vpc_id" {
  type        = string
  description = "VPC ID that the cluster that will be created"
}

variable "public_subnet_id_master" {
  type        = string
  description = "Core network id"
}
variable "public_subnet_id_slave" {
  type        = string
  description = "Secondy network id"
}
