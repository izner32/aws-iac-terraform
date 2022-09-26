/**
  Overview:
   * Create EKS Cluster
*/
resource "aws_eks_cluster" "cluster" {
  name     = "${var.environment}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}