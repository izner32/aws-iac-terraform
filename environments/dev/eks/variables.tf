variable "environment" {
    type        = string
    description = "Environment name, e.g. dev,prod,etc. to be used as Repository Name"
    default = "dev"
}

/**
   * @dev Credentials
*/
variable "admin_ecr_access_key" {
    type = string 
    default = "value"
}
variable "admin_ecr_secret_key" {
    type = string 
    default = "value"
}
variable "region" {
    type = string 
    default = "value"
}