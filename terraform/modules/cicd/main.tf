resource "aws_s3_bucket" "synthesis_artificats_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "development"
  }
}