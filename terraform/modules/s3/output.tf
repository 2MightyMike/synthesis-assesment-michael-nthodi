output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.synthesis_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.synthesis_bucket.arn
}

output "versioning_status" {
  description = "The versioning status of the S3 bucket"
  value       = aws_s3_bucket_versioning.synthesis_bucket_versioning.versioning_configuration[0].status
}