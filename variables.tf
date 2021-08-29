variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
}

variable "profile" {
  type        = string
  description = "AWS profile"
  default     = "default"
}

variable "credentials_file" {
  type        = string
  description = "Path to the AWS credentials file"
  default     = "~/.aws/credentials"
}

variable "default_tags" {
  type        = map(any)
  description = "Default tags in key-value pairs"
  default = {
    Name : "terraform_custom_emr_module"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC associated with EMR"
  default     = "10.0.0.0/16"
}

variable "emr_role_name" {
  type        = string
  description = "The name of the EMR IAM role"
  default     = "emr_role"
}

variable "emr_iam_instance_profile_name" {
  type        = string
  description = "The name of the EC2 instance profile"
}

variable "s3_log_bucket_name" {
  type        = string
  description = "Name of the bucket to store cluster logs"
}

variable "s3_log_bucket_versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3_bootstrap_bucket" {
  type        = string
  description = "Bucket to store action/bootstrap scripts"
}

variable "s3_bootstrap_bucket_versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3_input_bucket" {
  type        = string
  description = "Bucket to store input files"
}

variable "s3_input_bucket_versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3_output_bucket" {
  type        = string
  description = "Bucket to store output"
}

variable "s3_output_bucket_versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "emr_bootstrap_script" {
  type        = string
  description = "Name of the bootstrap script for EMR"
  default     = "emr_bootstrap.sh"
}


variable "ssh_key_name" {
  type        = string
  description = "Name of the SSH key"
}

variable "ssh_key_path" {
  type        = string
  description = "Path and file name of the ssh key"
}

variable "sg_name_prefix" {
  type        = string
  description = "Prefix for name of the EMR security groups"
}

# emr variables
variable "emr_name" {
  type        = string
  description = "The name of the emr cluster"
}

variable "emr_release_label" {
  type        = string
  description = "The EMR version"
  default     = "emr-5.33.0"
}

variable "emr_applications" {
  type        = list(any)
  description = <<EOT
    List of the applications to install in the cluster. The default value is:
    Spark 2.4.7 on Hadoop 2.10.1 YARN and Zeppelin 0.9.0
  EOT
  default     = ["Spark", "Zeppelin"]
}

variable "emr_master_instance_type" {
  type        = string
  description = <<EOT
    The EC2 instance type for the master node. The master node manages the cluster
    and typically runs master components of distributed applications, e.g. YARN.
  EOT
  default     = "m5.xlarge"
}

variable "emr_core_instance_type" {
  type        = string
  description = <<EOT
    The EC2 instance type for the core nodes. The code nodes are managed by the 
    master node. Code nodes coordinate data storage as part of the HDFS and perform
    other parallel computation tasks on data.
  EOT
  default     = "m5.xlarge"
}

variable "emr_core_instance_count" {
  type        = number
  description = "The number of instances of core nodes"
  default     = 2
}

