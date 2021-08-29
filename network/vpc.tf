# vpc for EMR since the cluster will be launched within an EC2-VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  // if true, queueries the AWS DNS server at 169.254.169.253
  enable_dns_hostnames = true

  // if true, assign public hostname to EC2 instance if it is public
  enable_dns_support = true

  tags = var.default_tags
}
