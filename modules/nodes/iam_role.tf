resource "aws_iam_role" "eks-role-worker" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  max_session_duration = "3600"
  name                 = "${var.cluster_name}-${var.node_name}"
  path                 = "/"

  tags = {
    Name        = "${var.cluster_name}-${var.node_name}"
  }
}

output "role_arn" {
  value = aws_iam_role.eks-role-worker.arn
}
