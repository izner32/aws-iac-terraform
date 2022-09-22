resource "aws_ecr_repository" "repository" {
  name                 = var.environment
  image_tag_mutability = var.image_tag_mutability ? "MUTABLE" : "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  # tags = {
  #   tag-key = ""
  # }
}