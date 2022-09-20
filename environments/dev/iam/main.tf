module "ecr" {
    source = "../../../modules/iam"

    environment = "${var.environment_name}"
}
