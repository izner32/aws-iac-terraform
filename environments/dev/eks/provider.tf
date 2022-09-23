provider "aws" {
    access_key = var.admin_ecr_access_key
    secret_key = var.admin_ecr_secret_key
    region = var.region
}
