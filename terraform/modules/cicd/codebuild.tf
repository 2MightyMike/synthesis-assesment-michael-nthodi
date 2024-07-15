locals {
  app_name = "synthesis-build"
  tags ={
    Name        = var.bucket_name
    Environment = "development"
  }
  branchName    = "main"
}

resource "aws_codebuild_project" "checkov_test" {
  name         = "${local.app_name}-checkov-test"
  description  = "test IaC for vulnerabilities and misconfiguration"
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
    buildspec = "./dependencies/buildspec_checkov_test.yaml"
  }
}

resource "aws_codebuild_project" "terraform_plan" {
  name         = "${local.app_name}-plan"
  description  = "plan terraform"
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
    buildspec = "./dependencies/buildspec_plan.yaml"
  }
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
    buildspec = "./dependencies/buildspec_apply.yaml"
  }
}

