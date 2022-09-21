resource "aws_ecr_repository" "repository" {
  name                 = "snapshot"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  # tags = {
  #   tag-key = ""
  # }
}