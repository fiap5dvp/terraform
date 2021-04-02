resource "aws_iam_instance_profile" "node-group-instance-role" {
  name = "${var.cluster_name}-${var.node_name}-Profile"
  path = "/"
  role = aws_iam_role.eks-role-worker.name
}
