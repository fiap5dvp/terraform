resource "aws_iam_role" "eks-role-master" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EKS to manage clusters on your behalf."
  max_session_duration = "3600"
  name                 = "${var.cluster_name}-Master"
  path                 = "/"

  tags = {
    Name = "${var.cluster_name}-Master"
  }
}

resource "aws_iam_role" "EKS-cluster-Autoscaler" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "sts.amazonaws.com."
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EKS to Autoscaling clusters on your behalf."
  max_session_duration = "3600"
  name                 = "AmazonEKSClusterAutoscalerRole"
  path                 = "/"

  tags = {
    Name = "${var.cluster_name}-Master"
  }
}
