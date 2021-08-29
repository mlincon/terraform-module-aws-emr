# define roles for EMR cluster

# create a IAM role for EMR and assume service role
# EMR can then perform any tasks granted by the permission policies assigned 
# to the role

# the policy to assume is provided via data object
resource "aws_iam_role" "emr_role" {
  name               = var.emr_role_name
  assume_role_policy = data.template_file.emr_iam_policy.rendered

  tags = var.default_tags
}


# assign permission policy to the role
# since we'll be using AWS managed policies, we will use the aws_iam_role_policy_attachment resource
# if we implemented the policy in terraform (i.e. created ourselves), 
# we would have used the resource aws_iam_role_policy at first
resource "aws_iam_role_policy_attachment" "emr_role_policies" {
  role = aws_iam_role.emr_role.id

  # this is the default managed policy for the default EMR Role
  # ref: https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-iam-roles.html
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}