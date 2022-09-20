// define a group
resource "aws_iam_group" "G1" {
  name = "CICD"
}

// define a user 
resource "aws_iam_user" "U1" {
  name = "Renz"

  # tags = {
  #   tag-key = ""
  # }
}

// [optional] define an identity based user-defined policy

// adding a user to the group
resource "aws_iam_user_group_membership" "example1" {
  user = aws_iam_user.U1.name

  groups = [
    aws_iam_group.G1.name,
  ]
}

// attach a policy to the group 
resource "aws_iam_group_policy_attachment" "test-attach" {
  // define aws managed policies
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", 
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ])

  group      = aws_iam_group.G1.name
  policy_arn = each.value
}