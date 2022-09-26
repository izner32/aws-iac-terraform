module "ecr" {
    source = "../../../modules/vpc"

    environment = "dev"
}