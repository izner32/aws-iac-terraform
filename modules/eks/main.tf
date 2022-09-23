// create eks cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.environment
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}