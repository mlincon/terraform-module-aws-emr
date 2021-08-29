# s3 bucket for storing input files
resource "aws_s3_bucket" "input-bucket" {
  bucket = var.s3-input-bucket
  region = var.region

  versioning {
    enabled = var.s3-input-bucket-versioning
  }

  tags = var.default_tags
}
