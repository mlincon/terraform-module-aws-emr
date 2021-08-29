# get my IPv4: https://stackoverflow.com/a/53782560/11868112
data "http" "myipv4" {
  url = "http://ipv4.icanhazip.com"
}

# get the AZs available in the region configured in the provider
data "aws_availability_zones" "available_azs" {
  # filters out availability zones that currently experience outages
  state = "available"
}

# replace the "aws_services_list" placeholder in the EMR
data "template_file" "emr_iam_policy" {
  # path.module returns the filesystem path of the module where the expression is defined
  template = file("${path.module}/assume_role_policy.json")

  vars = {
    aws_services_list = join(", ", local.emr_services)
  }
}

data "template_file" "ec2_instance_iam_policy" {
  # path.module returns the filesystem path of the module where the expression is defined
  template = file("${path.module}/assume_role_policy.json")

  vars = {
    aws_services_list = join(", ", local.ec2_instance_profile)
  }
}