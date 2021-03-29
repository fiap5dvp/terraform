resource "aws_iam_role_policy_attachment" "cluster-autoScaler-fullAccess" {
  policy_arn = "arn:aws:iam::337161345835:policy/Cluster_AutoScaler_FullAccess"
  role       = aws_iam_role.eks-role-worker.name
}

resource "aws_iam_role_policy_attachment" "databricks-bucket-readonly-access" {
  policy_arn = "arn:aws:iam::337161345835:policy/s3-databricks-bucket-readonly-access"
  role       = aws_iam_role.eks-role-worker.name
}

resource "aws_iam_role_policy_attachment" "amazon-EC2-rolefor-SSM" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.eks-role-worker.name
}

resource "aws_iam_role_policy_attachment" "amazon-EKS-CNI-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-role-worker.name
}

resource "aws_iam_role_policy_attachment" "amazon-EC2-container-registry-readonly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-role-worker.name
}

resource "aws_iam_role_policy_attachment" "amazon-EKS-worker-node-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-role-worker.name
}
