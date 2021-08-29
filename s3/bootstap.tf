# s3 bucket for bootstrap actions
resource "aws_s3_bucket" "bootstrap_bucket" {
  bucket = var.s3_bootstrap_bucket
  region = var.region

  versioning {
    enabled = var.s3_bootstrap_bucket_versioning
  }

  tags = var.default_tags
}

# upload the bootstrap script in s3
resource "aws_s3_bucket_object" "emr_bootstrap_script" {
  depends_on = [
    aws_s3_bucket.bootstrap_bucket
  ]

  bucket = aws_s3_bucket.bootstrap_bucket.id
  key    = "scripts/${var.emr_bootstrap_script}"
  source = "${path.module}/../scripts/${var.emr_bootstrap_script}"

  tags = var.default_tags
}