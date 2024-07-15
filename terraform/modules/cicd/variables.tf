variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "codebuild_configuration" {
  type    = map(string)
  default = {
    cb_compute_type = "BUILD_GENERAL1_SMALL"
    cb_image        = "aws/codebuild/standard:5.0"
    cb_type         = "LINUX_CONTAINER"
  }
}