locals {
  # gets the first two part from the VPC CIDR block
  subnet_cidr_fixed_part = join(".", slice(split(".", var.vpc_cidr_block), 0, 2))
}

locals {
  subnet_cidr = "${local.subnet_cidr_fixed_part}.1.0/24"
}