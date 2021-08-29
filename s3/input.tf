# s3 bucket for storing input files
resource "aws_s3_bucket" "input_bucket" {
  bucket = var.s3_input_bucket
  region = var.region

  versioning {
    enabled = var.s3_input_bucket_versioning
  }

  tags = var.default_tags
}
