# s3

# s3 bucket for storing logs
resource "aws_s3_bucket" "log-bucket" {
  bucket = var.s3-log-bucket-name
  region = var.region

  versioning {
    enabled = var.s3-log-bucket-versioning
  }

  tags = var.default_tags
}


# s3 bucket for bootstrap actions
resource "aws_s3_bucket" "bootstrap-bucket" {
  bucket = var.s3-bootstrap-bucket
  region = var.region

  versioning {
    enabled = var.s3-bootstrap-bucket-versioning
  }

  tags = var.default_tags
}
