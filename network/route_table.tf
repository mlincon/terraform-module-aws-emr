# routing table to direct traffic to and from internet gateway
resource "aws_route_table" "rt_igw" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = var.default_tags
}
