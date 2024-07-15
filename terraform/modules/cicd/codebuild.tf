locals {
  app_name = "synthesis-build"
  tags ={
    Name        = var.bucket_name
    Environment = "development"
  }
  branchName    = "main"
}

resource "aws_codebuild_project" "terraform_apply" {
  name         = "${local.app_name}-apply"
  description  = "apply terraform"
  service_role = aws_iam_role.codebuild.arn
  tags         = local.tags

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = var.codebuild_configuration["cb_compute_type"]
    image        = var.codebuild_configuration["cb_image"]
    type         = var.codebuild_configuration["cb_type"]
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "./dependencies/buildspec-apply.yml"
  }
}