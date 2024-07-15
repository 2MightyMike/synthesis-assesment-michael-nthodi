locals {
  app_name = "synthesis-codecommit"
  tags ={
    Name        = var.bucket_name
    Environment = "development"
  }
  branchName    = "main"
}

resource "aws_codecommit_repository" "synthesis-codecommit" {
  repository_name = "${local.app_name}-repo"
  description     = "This is the Sample App Repository for Sythesis Code"
  kms_key_id      = aws_kms_key.test.arn
}

resource "aws_kms_key" "codecommit_key" {
  description             = "KMS key used for code commit encryption"
  deletion_window_in_days = 7
}