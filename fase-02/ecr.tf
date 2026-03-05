# This file creates a private ECR repository.

resource "aws_ecr_repository" "vav-ecr" {
  name                 = "vav-ecr"
  image_tag_mutability = "MUTABLE"
}