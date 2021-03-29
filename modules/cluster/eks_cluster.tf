resource "aws_eks_cluster" "eks_cluster" {
  enabled_cluster_log_types = var.cluster_log_types
  name                      = var.cluster_name
  role_arn                  = aws_iam_role.eks-role-master.arn
  version                   = var.cluster_version

  vpc_config {
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
    public_access_cidrs = [
      "${chomp(data.http.myip.body)}/32"
    ]
    security_group_ids = [aws_security_group.default.id]
    subnet_ids = [
      aws_subnet.subnet-master.id,
      aws_subnet.subnet-slave.id
    ]
  }
}
