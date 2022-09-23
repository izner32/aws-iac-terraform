/**
   * @dev Network Configuration
*/
variable "cidr_block" {
  type = map(string)
  description = "A Map of CIDR Blocks"
  default = {
    vpc = "10.0.0.0/16"

    route_table_public = "0.0.0.0/0"
    route_table_private_1 = "0.0.0.0/0"
    route_table_private_2 = "0.0.0.0/0"

    subnet_public_1 = "10.0.1.0/24"
    subnet_public_2 = "10.0.1.0/24"
    subnet_private_1 = "10.0.1.0/24"
    subnet_private_2 = "10.0.1.0/24"
  
  }
}

variable "route_table_public_count" {
  type = number
  description = "Number of Public Route Tables"
  default = 1
}

variable "route_table_private_count" {
  type = number 
  description = "Number of Private Route Tables"
}

/**
   * @dev EKS Configuration
*/


/**
   * @dev EKS Configuration
*/
