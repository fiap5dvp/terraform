resource "aws_iam_policy" "autoscaling" {
  name        = "${var.cluster_name}-AmazonEKSClusterAutoscalerPolicy"
  description = "Autoscalling Policy"
  policy      = data.aws_iam_policy_document.autoscaling_policy_doc.json
}

