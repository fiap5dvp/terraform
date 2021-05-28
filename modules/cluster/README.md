## Providers

The following providers are used by this module:

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.34.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.1.0 |



## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource 
| [aws_iam_policy.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.EKS-cluster-Autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks-role-master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.amazon-EKS-cluster-autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role.eks-role-master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.amazon-EKS-cluster-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.amazon-EKS-service-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route_table_association.subnet-association-master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet-association-slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.eks-master-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_tcp_443_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.subnet-master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet-slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_iam_policy_document.autoscaling_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route_table.rts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_vpc.vpc_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

The following input variables are required:
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_master"></a> [availability\_zone\_master](#input\_availability\_zone\_master) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_availability_zone_slave"></a> [availability\_zone\_slave](#input\_availability\_zone\_slave) | n/a | `string` | `"us-east-1b"` | no |
| <a name="input_cluster_log_types"></a> [cluster\_log\_types](#input\_cluster\_log\_types) | n/a | `list(any)` | <pre>[<br>  "scheduler",<br>  "controllerManager",<br>  "audit",<br>  "api",<br>  "authenticator"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster Name was created | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Cluster Version | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_master"></a> [public\_subnet\_cidr\_master](#input\_public\_subnet\_cidr\_master) | Core network CIDR block | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_slave"></a> [public\_subnet\_cidr\_slave](#input\_public\_subnet\_cidr\_slave) | Secondy network CIDR block | `string` | n/a | yes |
| <a name="input_routetable_name"></a> [routetable\_name](#input\_routetable\_name) | n/a | `string` | `"Default Public"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC Name that the cluster that will be created | `string` | n/a | yes |


## Outputs

The following outputs are exported:

| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_cidr_master"></a> [public\_subnet\_cidr\_master](#input\_public\_subnet\_cidr\_master) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_cidr_slave"></a> [public\_subnet\_cidr\_slave](#input\_public\_subnet\_cidr\_slave) | n/a | `any` | n/a | yes |
| <a name="input_routetable_name"></a> [routetable\_name](#input\_routetable\_name) | n/a | `string` | `"Default Public"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `any` | n/a | yes |

