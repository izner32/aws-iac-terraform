/**
   * @dev Create group/s 
*/
resource "aws_iam_group" "groups" {
  count = length(var.groups)
  name  = var.groups[count.index]
}

/**
   * @dev Create user/s with programmatic access
*/ 
resource "aws_iam_user" "users" {
  count = length(var.users)
  name  = var.users[count.index]
  path  = "/"

  # tags = {
  #   Name = var.users[count.index]
  # }
}

resource "aws_iam_access_key" "users" {
  count = length(var.users)
  user  = aws_iam_user.users[count.index].name
}

/**
   * @dev Create identity-based policies
*/

/**
   * @dev Attach user/s to group/s
*/
resource "aws_iam_group_membership" "admin" {
  name = "Admin"
  users = [
    "Admin-ECR",
    "Admin-EKS",
    "Admin-IAM"
  ]
  group = aws_iam_group.groups[0].name
}

resource "aws_iam_group_membership" "cicd" {
  name = "CICD"
  users = [
    "CICD-Renz"
  ]
  group = aws_iam_group.groups[1].name
}

/**
   * @dev Attach policy/ies to group/s or user/s
*/

resource "aws_iam_user_policy_attachment" "admin-ecr" {
  user       = aws_iam_user.users[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_user_policy_attachment" "admin-eks" {
  user       = aws_iam_user.users[1].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_user_policy_attachment" "admin-iam" {
  user       = aws_iam_user.users[2].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

// TODO - attach policy to cicd users

