# Makefile

# Variables
BUCKET_NAME=synthesis-bucket-by-michael-nthodi
REGION=us-west-1

# Default target
.PHONY: all
all: init plan apply

# Initialize Terraform
.PHONY: init
init:
	cd terraform/s3
	terraform init

# Plan the Terraform deployment
.PHONY: plan
plan:
	cd terraform/s3
	terraform plan -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)"

# Apply the Terraform deployment
.PHONY: apply
apply:
	terraform apply -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)" -auto-approve

# Destroy the Terraform-managed infrastructure
.PHONY: destroy
destroy:
	terraform destroy -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)" -auto-approve

