# s3 bucket for bootstrap actions
resource "aws_s3_bucket" "bootstrap-bucket" {
  bucket = var.s3-bootstrap-bucket
  region = var.region

  versioning {
    enabled = var.s3-bootstrap-bucket-versioning
  }

  tags = var.default_tags
}