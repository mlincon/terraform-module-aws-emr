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
    Name : "terraform-custom-redshift-module"
  }
}