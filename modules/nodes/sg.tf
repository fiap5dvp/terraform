resource "aws_security_group" "eks-worker-sg" {
  description = "Security group for all nodes in the cluster"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description = "Allow node to communicate with each other"
    from_port   = "0"
    protocol    = "-1"
    self        = "true"
    to_port     = "0"
  }

  ingress {
    description     = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
    from_port       = "1025"
    protocol        = "tcp"
    security_groups = [var.eks_master_sg_id]
    self            = "false"
    to_port         = "65535"
  }

  ingress {
    description     = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane"
    from_port       = "443"
    protocol        = "tcp"
    security_groups = [var.eks_master_sg_id]
    self            = "false"
    to_port         = "443"
  }


  name = "${var.cluster_name}-${var.node_name}"

  tags = {
    Name                                        = "${var.cluster_name}-${var.node_name}"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }

  vpc_id = data.aws_vpc.vpc_name.id
}

resource "aws_security_group_rule" "egress_tcp_1025_sg" {
  description              = "Allow the cluster control plane to communicate with worker Kubelet and pods"
  from_port                = "1025"
  protocol                 = "tcp"
  security_group_id        = var.eks_master_sg_id
  source_security_group_id = aws_security_group.eks-worker-sg.id
  to_port                  = "65535"
  type                     = "egress"
}

resource "aws_security_group_rule" "egress_tcp_443_sg" {
  description              = "Allow the cluster control plane to communicate with pods running extension API servers on port 443"
  from_port                = "443"
  protocol                 = "tcp"
  security_group_id        = var.eks_master_sg_id
  source_security_group_id = aws_security_group.eks-worker-sg.id
  to_port                  = "443"
  type                     = "egress"
}

resource "aws_security_group_rule" "ingress_tcp_443_group_sg" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = "443"
  protocol                 = "tcp"
  security_group_id        = var.eks_master_sg_id
  source_security_group_id = aws_security_group.eks-worker-sg.id
  to_port                  = "443"
  type                     = "ingress"
}
