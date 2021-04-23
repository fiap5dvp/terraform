# Define the public subnet
locals {
  public_subnet_count      = var.max_subnet_count == 0 ? length(flatten(data.aws_availability_zones.available.*.names)) : var.max_subnet_count
  availability_zones_count = length(data.aws_availability_zones.available.*.names)
}

resource "aws_subnet" "public" {
  count             = local.availability_zones_count
  vpc_id            = join("", aws_vpc.vpc.*.id)
  availability_zone = element(data.aws_availability_zones.available.*.names, count.index)

  cidr_block = cidrsubnet(
    signum(length(var.vpc_cidr)) == 1 ? var.vpc_cidr : join("", aws_vpc.vpc.*.cidr_block),
    ceil(log(local.public_subnet_count * 2, 2)),
    local.public_subnet_count + count.index
  )

}
