module "ecr" {
    source = "../../../modules/ecr"

    environment = "${var.environment_name}"
}
