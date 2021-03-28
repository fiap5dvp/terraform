output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_version" {
  value = aws_eks_cluster.eks_cluster.version
}

output "eks_master_sg_id" {
  value = aws_security_group.eks-master-sg.id
}

output "subnet_id_master" {
  value = aws_subnet.subnet-master.id

  depends_on = [
    aws_subnet.subnet-master,
    aws_subnet.subnet-slave
  ]
}

output "subnet_id_slave" {
  value = aws_subnet.subnet-slave.id

  depends_on = [
    aws_subnet.subnet-master,
    aws_subnet.subnet-slave
  ]
}

output "vpc_name" {
  value = var.vpc_name
}
