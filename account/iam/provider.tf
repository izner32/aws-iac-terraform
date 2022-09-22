provider "aws" {
    access_key = var.admin_iam_access_key
    secret_key = var.admin_iam_secret_key
    region = var.region
}
