# define role s for EC2 instance profile
# AmazonElasticMapReduceforEC2Role
resource "aws_iam_role" "ec2_instance_profile_role" {
  name               = var.emr_role_name
  assume_role_policy = data.template_file.ec2_instance_iam_policy.rendered

  tags = var.default_tags
}

resource "aws_iam_role_policy_attachment" "ec2_instance_profile_role_policies" {
  role = aws_iam_role.ec2_instance_profile_role.id

  # this is the default managed policy for the default EMR EC2 profile role
  # ref: https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-iam-roles.html
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
}

resource "aws_iam_instance_profile" "emr_profile" {
  name = var.emr_iam_instance_profile_name
  role = aws_iam_role_policy_attachment.ec2_instance_profile_role_policies.id
}
