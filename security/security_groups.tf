# Security group for master node
resource "aws_security_group" "master_sg" {
  depends_on = [aws_vpc.vpc]

  name   = "${var.sg_name_prefix}_master"
  vpc_id = aws_vpc.vpc.id

  # EMR may automatically add required rules to security groups used with the 
  # service, and those rules may contain a cyclic dependency that prevent the 
  # security groups from being destroyed without removing the dependency first
  revoke_rules_on_delete = true

  tags = var.default_tags
}

# Security group for slave nodes
resource "aws_security_group" "slave_sg" {
  depends_on = [aws_vpc.vpc]

  name                   = "${var.sg_name_prefix}_slave"
  vpc_id                 = aws_vpc.vpc.id
  revoke_rules_on_delete = true

  tags = var.default_tags
}

# ingress rules for security groups
resource "aws_security_group_rule" "ingress_master_ssh" {
  description       = "allow SSH traffic"
  type              = "ingress"
  security_group_id = aws_security_group.master_sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  # my public IP address
  cidr_blocks = [local.sg_ingress_cidr]
}

resource "aws_security_group_rule" "ingress_slave_ssh" {
  description       = "allow SSH traffic"
  type              = "ingress"
  security_group_id = aws_security_group.slave_sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  # my public IP address
  cidr_blocks = [local.sg_ingress_cidr]
}

# self referencing to permit inbound connections, so that any resources 
# associated with the security group can communicate with other resources within
# the same security group
resource "aws_security_group_rule" "ingress_master_self" {
  description       = "allow communication between nodes in the VPC"
  type              = "ingress"
  security_group_id = aws_security_group.master_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = _1

  # the security group itself will be added as a source to this ingress rule
  self = true
}

resource "aws_security_group_rule" "ingress_slave_self" {
  description       = "allow communication between nodes in the VPC"
  type              = "ingress"
  security_group_id = aws_security_group.slave_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1

  # the security group itself will be added as a source to this ingress rule
  self = true
}


# egress rules for security groups
resource "aws_security_group_rule" "egress_master" {
  description       = "EMR-master outbound"
  type              = "egress"
  security_group_id = aws_security_group.master_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_slave" {
  description       = "EMR-slave outbound"
  type              = "egress"
  security_group_id = aws_security_group.slave_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
}