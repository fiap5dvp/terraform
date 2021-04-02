locals {
  image_names = length(var.image_names)
}

resource "aws_ecr_repository" "name" {
  for_each = local.image_names
  name     = each.value

  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

}
