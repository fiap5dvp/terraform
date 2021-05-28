## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_eip.eip_vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_network_interface.vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_network_interface_sg_attachment.eni-vpn-sg-att](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_sg_attachment) | resource |
| [aws_route_table.private-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-1a-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.vpn_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private-subnet-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private-subnet-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private-subnet-1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private-subnet-1d](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1d](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1e](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1f](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Tell account name | `any` | n/a | yes |
| <a name="input_architecture"></a> [architecture](#input\_architecture) | n/a | `string` | `"amd64"` | no |
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | Define the dns name to use on VPN, only the name of vpn, because use var.dns\_zone.empregoligado.net. | `any` | n/a | yes |
| <a name="input_dns_server"></a> [dns\_server](#input\_dns\_server) | n/a | `string` | `"0.0.0.0/32"` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | Define the dns zone, only name because use hardcode empregoligado.net | `any` | n/a | yes |
| <a name="input_hostname_vpn"></a> [hostname\_vpn](#input\_hostname\_vpn) | n/a | `string` | `"vpn"` | no |
| <a name="input_instance_type_vpn"></a> [instance\_type\_vpn](#input\_instance\_type\_vpn) | VPN Server Instance Type | `string` | `"t3a.medium"` | no |
| <a name="input_key_file"></a> [key\_file](#input\_key\_file) | SSH privade key | `any` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Public key to use on Ec2 | `any` | n/a | yes |
| <a name="input_levee_ip"></a> [levee\_ip](#input\_levee\_ip) | Configure Levee IP | `any` | n/a | yes |
| <a name="input_os_version"></a> [os\_version](#input\_os\_version) | n/a | `string` | `"bionic-18.04"` | no |
| <a name="input_private_subnet_cidr-1a"></a> [private\_subnet\_cidr-1a](#input\_private\_subnet\_cidr-1a) | CIDR for the private subnet-1a | `string` | `"10.60.10.0/24"` | no |
| <a name="input_private_subnet_cidr-1b"></a> [private\_subnet\_cidr-1b](#input\_private\_subnet\_cidr-1b) | CIDR for the private subnet-1b | `string` | `"10.60.12.0/24"` | no |
| <a name="input_private_subnet_cidr-1c"></a> [private\_subnet\_cidr-1c](#input\_private\_subnet\_cidr-1c) | CIDR for the private subnet-1c | `string` | `"10.60.14.0/24"` | no |
| <a name="input_private_subnet_cidr-1d"></a> [private\_subnet\_cidr-1d](#input\_private\_subnet\_cidr-1d) | CIDR for the private subnet-1d | `string` | `"10.60.16.0/24"` | no |
| <a name="input_public_subnet_cidr-1a"></a> [public\_subnet\_cidr-1a](#input\_public\_subnet\_cidr-1a) | CIDR for the public subnet-1a | `string` | `"10.60.1.0/24"` | no |
| <a name="input_public_subnet_cidr-1b"></a> [public\_subnet\_cidr-1b](#input\_public\_subnet\_cidr-1b) | CIDR for the public subnet-1b | `string` | `"10.60.2.0/24"` | no |
| <a name="input_public_subnet_cidr-1c"></a> [public\_subnet\_cidr-1c](#input\_public\_subnet\_cidr-1c) | CIDR for the public subnet-1c | `string` | `"10.60.4.0/24"` | no |
| <a name="input_public_subnet_cidr-1d"></a> [public\_subnet\_cidr-1d](#input\_public\_subnet\_cidr-1d) | CIDR for the public subnet-1d | `string` | `"10.60.5.0/24"` | no |
| <a name="input_public_subnet_cidr-1e"></a> [public\_subnet\_cidr-1e](#input\_public\_subnet\_cidr-1e) | CIDR for the public subnet-1e | `string` | `"10.60.6.0/24"` | no |
| <a name="input_public_subnet_cidr-1f"></a> [public\_subnet\_cidr-1f](#input\_public\_subnet\_cidr-1f) | CIDR for the public subnet-1f | `string` | `"10.60.7.0/24"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR for the VPC | `string` | `"10.60.0.0/16"` | no |
| <a name="input_vpn_cidr"></a> [vpn\_cidr](#input\_vpn\_cidr) | CIDR for the VPC | `string` | `"10.60.3.0/16"` | no |
| <a name="input_vpn_num_instances"></a> [vpn\_num\_instances](#input\_vpn\_num\_instances) | n/a | `number` | `1` | no |
| <a name="input_vpn_playbook"></a> [vpn\_playbook](#input\_vpn\_playbook) | Ansible playbook to do nat server | `string` | `"ansible/vpn.yml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami_id"></a> [ami\_id](#output\_ami\_id) | n/a |
