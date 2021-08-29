# s3 bucket for storing output files
resource "aws_s3_bucket" "output-bucket" {
  bucket = var.s3-output-bucket
  region = var.region

  versioning {
    enabled = var.s3-output-bucket-versioning
  }

  tags = var.default_tags
}