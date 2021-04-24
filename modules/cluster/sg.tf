resource "aws_security_group" "default" {
  description = "${var.cluster_name}-Master Default Security Group"
  name        = "${var.cluster_name}-Master-Default"

  vpc_id = var.vpc_id
}

resource "aws_security_group" "eks-master-sg" {
  description = "${var.cluster_name}-Master Security Group"
  name        = "${var.cluster_name}-Master"

  tags = {
    Name = "${var.cluster_name}-Master"
  }

  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress_tcp_443_sg" {
  cidr_blocks       = ["${chomp(data.http.myip.body)}/32", data.aws_vpc.vpc_id.cidr_block]
  description       = "Default access"
  from_port         = "443"
  protocol          = "tcp"
  security_group_id = aws_security_group.eks-master-sg.id
  to_port           = "443"
  type              = "ingress"
}
