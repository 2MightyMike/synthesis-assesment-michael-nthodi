# Makefile

# Variables
BUCKET_NAME=synthesis-bucket-by-michael-nthodi
REGION=us-west-1
TERRAFORM_VERSION ?= 1.5.0
TF_DIR ?= terraform

# Install Terraform
install:
	@if ! [ -x "$$(command -v terraform)" ]; then \
		echo "Terraform is not installed. Installing Terraform..."; \
		curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
		unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
		sudo mv terraform /usr/local/bin/; \
		rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
		echo "Terraform installed successfully."; \
	else \
		echo "Terraform is already installed."; \
	fi

# Default target
.PHONY: all
all: init plan apply

# Initialize Terraform
.PHONY: init
init:
	cd $(TF_DIR) && terraform init

# Plan the Terraform deployment
.PHONY: plan
plan:
	cd $(TF_DIR) && terraform plan -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)"

# Apply the Terraform deployment
.PHONY: apply
apply:
	cd $(TF_DIR) && terraform apply -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)" -auto-approve

# Destroy the Terraform-managed infrastructure
.PHONY: destroy
destroy:
	cd $(TF_DIR) &&  terraform destroy -var "bucket_name=$(BUCKET_NAME)" -var "region=$(REGION)" -auto-approve

