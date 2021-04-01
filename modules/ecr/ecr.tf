locals {
  _name       = var.use_fullname ? module.this.id : module.this.name
  image_names = length(var.image_names) > 0 ? var.image_names : [local._name]
}

resource "aws_ecr_repository" "name" {
  for_each             = toset(module.this.enabled ? local.image_names : [])
  name                 = each.value

  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

}
