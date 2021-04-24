data "template_file" "container_instance_base_cloud_config" {
  template = file("${path.module}/cloud-config.tpl")

  vars = {
    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version
    group_name      = var.node_name
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

variable "key_name" {
  description = "Insert the name of public key"
}

variable "max_instances" {
  default = 1
}

variable "min_instances" {
  default = 1
}

variable "desired_capacity" {
  default = 1
}

variable "volume_size" {
  type    = string
  default = "80"
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "eks_master_sg_id" {}
variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnet_id_master" {}
variable "node_name" {}
variable "autoscaling_role" {}
