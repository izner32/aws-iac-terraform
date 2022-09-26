module "eks" {
    source = "../../../modules/eks"

    environment = "dev"
}