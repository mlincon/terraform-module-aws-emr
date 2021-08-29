# Attach Internet Gateway to the above VPC so that it's accessible from internet
# This will allow instances and devices outside the VPC to connect to database 
# through the cluster endpoint
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}
