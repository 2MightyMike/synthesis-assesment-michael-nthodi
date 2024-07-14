resource "aws_s3_bucket" "synthesis_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "development"
  }
}

resource "aws_s3_bucket_versioning" "synthesis_bucket_versioning" {
  bucket = aws_s3_bucket.synthesis_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}