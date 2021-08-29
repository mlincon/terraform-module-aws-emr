# a public subnet
resource "aws_subnet" "emr_subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = local.subnet_cidr
  # map_public_ip_on_launch = true

  tags = var.default_tags
}


# associate route table to subnet so that it becomes "public"
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.emr_subnet.id
  route_table_id = aws_route_table.rt_igw.id
}
