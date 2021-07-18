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
    Name : "terraform-custom-emr-module"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC associated with EMR"
  default     = "10.0.0.0/16"
}


variable "s3-log-bucket-name" {
  type        = string
  description = "Name of the bucket to store cluster logs"
}

variable "s3-log-bucket-versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3-bootstrap-bucket" {
  type        = string
  description = "Bucket to store action/bootstrap scripts"
}

variable "s3-bootstrap-bucket-versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3-input-bucket" {
  type        = string
  description = "Bucket to store input files"
}

variable "s3-input-bucket-versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "s3-output-bucket" {
  type        = string
  description = "Bucket to store output"
}

variable "s3-output-bucket-versioning" {
  type        = string
  description = "Whether to activate versioninig"
  default     = "enabled"
}

variable "ssh-key-name" {
  type = string
  description = "Name of the SSH key"  
}

variable "ssh-key-path" {
  type = string
  description = "Path and file name of the ssh key"
}

variable "sg-name-prefix" {
  type = string
  description = "Prefix for name of the EMR security groups"
}











