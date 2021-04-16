variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.60.0.0/16"
}

variable "levee_ip" {
  description = "Configure Levee IP " ###run curl ifconfig.io and insert value

}

variable "public_subnet_cidr-1a" {
  description = "CIDR for the public subnet-1a"
  default     = "10.60.1.0/24"
}


variable "public_subnet_cidr-1b" {
  description = "CIDR for the public subnet-1b"
  default     = "10.60.2.0/24"
}


variable "public_subnet_cidr-1c" {
  description = "CIDR for the public subnet-1c"
  default     = "10.60.4.0/24"
}

variable "public_subnet_cidr-1d" {
  description = "CIDR for the public subnet-1d"
  default     = "10.60.5.0/24"
}

variable "public_subnet_cidr-1e" {
  description = "CIDR for the public subnet-1e"
  default     = "10.60.6.0/24"
}

variable "public_subnet_cidr-1f" {
  description = "CIDR for the public subnet-1f"
  default     = "10.60.7.0/24"
}

variable "vpn_cidr" {
  description = "CIDR for the VPC"
  default     = "10.60.3.0/16"
}

variable "private_subnet_cidr-1a" {
  description = "CIDR for the private subnet-1a"
  default     = "10.60.10.0/24"
}

variable "private_subnet_cidr-1b" {
  description = "CIDR for the private subnet-1b"
  default     = "10.60.12.0/24"
}

variable "private_subnet_cidr-1c" {
  description = "CIDR for the private subnet-1c"
  default     = "10.60.14.0/24"
}


variable "private_subnet_cidr-1d" {
  description = "CIDR for the private subnet-1d"
  default     = "10.60.16.0/24"
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

variable "vpn_num_instances" {
  default = 1

}

variable "vpn_playbook" {
  description = "Ansible playbook to do nat server"
  default     = "ansible/vpn.yml"
}
variable "dns_server" {
  default = "0.0.0.0/32"

}

variable "dns_zone" {
  description = "Define the dns zone, only name because use hardcode empregoligado.net"

}

variable "dns_name" {
  description = "Define the dns name to use on VPN, only the name of vpn, because use var.dns_zone.empregoligado.net."
}
variable "account_name" {
  description = "Tell account name"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

