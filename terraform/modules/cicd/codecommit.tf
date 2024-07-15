resource "aws_codecommit_repository" "synthesis-codecommit" {
  repository_name = "${local.app_name}-repo"
  description     = "This is the Sample App Repository for Sythesis Code"
}