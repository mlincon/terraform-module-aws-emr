# s3 bucket for storing output files
resource "aws_s3_bucket" "output_bucket" {
  bucket = var.s3_output_bucket
  region = var.region

  versioning {
    enabled = var.s3_output_bucket_versioning
  }

  tags = var.default_tags
}