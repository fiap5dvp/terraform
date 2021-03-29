data "aws_vpc" "vpc_name" {
  filter {
    name   = "tag:Name"
    values = ["*${var.vpc_name}*"]
  }
}

data "template_file" "container_instance_base_cloud_config" {
  template = file("${path.module}/cloud-config.tpl")

  vars = {
    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version
    group_name      = var.group_name
  }
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-${var.cluster_version}-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["602401143452"] # Amazon
}

data "archive_file" "lambdazip" {
  type        = "zip"
  output_path = "${path.module}/lambda_functions.zip"
  source_dir  = "${path.module}/scripts/"
}

variable "key_name" {
  description = "Insert the name of public key"
}

variable "max_instances" {
  default = 15
}

variable "min_instances" {
  default = 1
}

variable "desired_capacity" {
  default = 1
}

variable volume_size {
  type    = string
  default = "250"
}

variable instance_type {
  type    = string
  default = "m5.xlarge"
}

variable eks_master_sg_id {}
variable cluster_name {}
variable cluster_version {}
variable vpc_name {}
variable subnet_id_master {}
variable group_name {}
variable node_name {}
