/**
  Overview:
   * Create ECR Repository
*/
resource "aws_ecr_repository" "repository" {
  count = length(var.repository_types)
  name                 = "${var.environment}-${var.repository_types[count.index]}"
  image_tag_mutability = var.image_tag_mutability ? "MUTABLE" : "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}
