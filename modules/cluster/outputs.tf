output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_version" {
  value = aws_eks_cluster.eks_cluster.version
}

output "eks_master_sg_id" {
  value = aws_security_group.eks-master-sg.id
}

output "autoscaling_role" {
  value = aws_iam_role.EKS-cluster-Autoscaler.arn

}
