# vpc for EMR since the cluster will be launched within an EC2-VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  // if true, queueries the AWS DNS server at 169.254.169.253
  enable_dns_hostnames = true

  // if true, assign public hostname to EC2 instance if it is public
  enable_dns_support = true
  
  tags = var.default_tags
}


# Attach Internet Gateway to the above VPC so that it's accessible from internet
# This will allow instances and devices outside the VPC to connect to database through the cluster endpoint
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}


# routing table to direct traffic to and from internet gateway
resource "aws_route_table" "rt-igw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = var.default_tags
}