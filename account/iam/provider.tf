provider "aws" {
    access_key = var.iam_access_key
    secret_key = var.iam_secret_key
    region = var.region
}
