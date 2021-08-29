locals {
  # set security group ingress CIDR to my ipv4 address
  sg_ingress_cidr = "${chomp(data.http.myipv4.body)}/32"

  # gets the first two part from the VPC CIDR block
  subnet_cidr_fixed_part = join(".", slice(split(".", var.vpc_cidr_block), 0, 2))

  # Service to assume IAM role
  emr_services         = ["elasticmapreduce.amazonaws.com"]
  ec2_instance_profile = ["ec2.amazonaws.com"]

}

locals {
  subnet_cidr = "${local.subnet_cidr_fixed_part}.1.0/24"
}