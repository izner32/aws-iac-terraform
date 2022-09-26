/**
   * @dev General IAM Configurations
*/
variable "groups" {
  type = list(string)
  description = "List of groups to create separated by Admin, and Job Functions (e.g. cicd)"
  default = [
    "Admin",
    "CICD"
  ]
}

variable "users" {
  type = list(string)
  description = "List of users to create"
  default = [
    // admin-users
    "Admin-ECR",
    "Admin-EKS",
    "Admin-IAM",

    // cicd users
    "CICD-Renz"
  ]
}

/**
   * @dev IAM Configurations
*/
