# Each cluster in Amazon EMR must have 
# - a service role and 
# - a role for the Amazon EC2 instance profile (an instance profile is used to 
#   pass an IAM role to an EC2 instance)
# Ref: https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-iam-roles.html


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


