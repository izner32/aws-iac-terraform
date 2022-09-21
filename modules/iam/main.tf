/**
   * @dev Create group/s 
*/
resource "aws_iam_group" "admins" {
  name = "Admin"

  # tags = {
  #   tag-key = ""
  # }
}

resource "aws_iam_group" "job_function_cicd" {
  name = "CICD"

  # tags = {
  #   tag-key = ""
  # }
}

/**
   * @dev Create user/s with programmatic access
*/ 
resource "aws_iam_user" "admin_ecr" {
  name = "ECR-Admin"

  # tags = {
  #   tag-key = ""
  # }
}

resource "aws_iam_access_key" "admin_ecr_access_key" {
  user = aws_iam_user.admin_ecr.name
}


resource "aws_iam_user" "admin_eks" {
  name = "EKS-Admin"

  # tags = {
  #   tag-key = ""
  # }
}

resource "aws_iam_access_key" "admin_eks_access_key" {
  user = aws_iam_user.admin_eks.name
}


resource "aws_iam_user" "job_function_cicd_user_1" {
  name = "Renz"

  # tags = {
  #   tag-key = ""
  # }
}

resource "aws_iam_access_key" "job_function_cicd_user_1_access_key" {
  user = aws_iam_user.job_function_cicd_user_1.name
}


/**
   * @dev Create identity-based policies
*/

/**
   * @dev Attach user/s to group/s
*/
resource "aws_iam_user_group_membership" "admins_attach_users" {
  users = [
    aws_iam_user.admin_ecr.name,
    aws_iam_user.admin_eks.name,
  ]

  groups = aws_iam_group.admins.name
}

resource "aws_iam_user_group_membership" "job_function_cicd_attach_users" {
  users = [
    aws_iam_user.job_function_cicd_user_1.name,
    aws_iam_user.admin_eks.name,
  ]

  groups = aws_iam_group.job_function_cicd.name
}

/**
   * @dev Attach policy/ies to group/s or user/s
*/
resource "aws_iam_user_policy_attachment" "admins_admin_ecr_attach_policy" {
  user       = aws_iam_user.admin_ecr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_user_policy_attachment" "admins_admin_eks_attach_policy" {
  user       = aws_iam_user.admin_ecr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_user_policy_attachment" "job_function_cicd_attach_policy" {
  user       = aws_iam_user.admin_ecr.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
