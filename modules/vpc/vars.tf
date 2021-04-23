variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.60.0.0/16"
}

variable "vpn_cidr" {
  description = "CIDR for the VPC"
  default     = "10.60.3.0/16"
}

data "aws_availability_zones" "available" {
  state = "available"
}

#### Nat ec2 parameters

variable "os_version" {
  default = "bionic-18.04"
}
variable "architecture" {
  default = "amd64"
}

variable "key_name" {
  description = "Public key to use on Ec2"
}

variable "key_file" {
  description = "SSH privade key"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-${var.os_version}-${var.architecture}-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

### VPN vars

variable "hostname_vpn" {
  default = "vpn"
}

variable "instance_type_vpn" {
  description = "VPN Server Instance Type"
  default     = "t3a.medium"
}

variable "vpn_playbook" {
  description = "Ansible playbook to do nat server"
  default     = "ansible/vpn.yml"
}
variable "dns_server" {
  default = "0.0.0.0/32"

}

variable "account_name" {
  description = "Tell account name"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

variable "env" {
  type = string

}

variable "max_subnet_count" {
  type    = number
  default = 2

}
