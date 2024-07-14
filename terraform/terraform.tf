terraform {
    #required_version = ">= 1.3.0, <= 1.5.5"
    required_providers {
        aws = {
            source ="hashicorp/aws"
            version = "~> 5.7.0"
        }
    }
}

provider "aws" {
  region                      = "${var.region}"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

  endpoints {
    dynamodb = "http://localhost:4569"
    s3       = "http://localhost:4572"
  }
}