resource "aws_emr_cluster" "cluster" {
  name          = var.emr_name
  release_label = var.emr_release_label
  applications  = var.emr_applications

  ec2_attributes {
    subnet_id                         = aws_subnet.emr_subnet.id
    emr_managed_master_security_group = aws_security_group.master_sg.id
    emr_managed_slave_security_group  = aws_security_group.slave_sg.id
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn

    key_name = aws_key_pair.emr_ssh_key.key_name
  }

  master_instance_group {
    instance_type = var.emr_master_instance_type
  }

  core_instance_group {
    instance_type  = var.emr_core_instance_type
    instance_count = var.emr_core_instance_count
  }

  log_uri = "s3://${aws_s3_bucket.log_bucket.bucket}"

  service_role = aws_iam_role.emr_role.arn

  bootstrap_action {
    name = var.bootstrap_name
    path = "s3://${aws_s3_bucket.log_bucket.bucket}/scripts/${var.emr_bootstrap_script}"
  }
}