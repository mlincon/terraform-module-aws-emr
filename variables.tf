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