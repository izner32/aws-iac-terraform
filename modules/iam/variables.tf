/**
   * @dev List of IAM Groups
*/
variable "groups" {
  type = list(string)
  default = [
    "Admin",
    "CICD"
  ]
}

/**
   * @dev List of IAM Users
*/
variable "users" {
  type = list(string)
  default = [
    // admin-users
    "Admin-ECR",
    "Admin-EKS",
    "Admin-IAM",

    // cicd users
    "CICD-Renz"
  ]
}
