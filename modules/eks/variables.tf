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

variable "resource_counts" {
  type = map(number)
  description = "A Map of Resource Counts"
  default = {
    route_table_public = 1 
    route_table_private = 2

    subnet_public = 2
    subnet_private = 2

    nat_gateway = 2
  }
}

variable "availability_zones" {
  type = list(string)
  description = "List of Availability Zones"
  default = ["us-east-1a", "us-east-1b"]
}

/**
   * @dev EKS Configuration
*/


/**
   * @dev EKS Configuration
*/
