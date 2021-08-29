# s3 bucket for storing logs
resource "aws_s3_bucket" "log_bucket" {
  bucket = var.s3_log_bucket_name
  region = var.region

  versioning {
    enabled = var.s3_log_bucket_versioning
  }

  tags = var.default_tags
}
