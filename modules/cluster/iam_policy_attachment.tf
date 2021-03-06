resource "aws_iam_role_policy_attachment" "amazon-EKS-service-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks-role-master.name
}

resource "aws_iam_role_policy_attachment" "amazon-EKS-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-role-master.name
}
