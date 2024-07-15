# Created by Michael Nthodi as part of the Synthesis Devops Assesment

# Terraform AWS EC2 Web Server Deployment

This project contains Terraform configurations to deploy a version enabled S3 bucket and an Nginx Web server on an EC2 instance in AWS. The setup of the Nginx web server includes a security group to allow HTTP and SSH access and user data to install and start the web server on instance launch.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.5.0 or later
- AWS credentials configured (via `aws configure` or environment variables)

## Modules in this repository

- `cicd`: Contains the main Terraform configuration for the the CodePipeline question that perform the deployment of IAC.
- `ec-2`: Contains the main Terraform configuration for the the CodePipeline question that performs the deployment of an NGINX web server
- `s3`: Contains the main Terraform configuration for the the CodePipeline question that perform the deployment of a versioning enabled S3 bucket

## Config Instructions

This repo is configured to be apply to run a terraform init and plan without additional configureation however before the repo can be applied the aws access key and secret key needs to be updated under ./terraform/terraform.tf

  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

## Setup Instructions

### 1. Install Terraform

Run the following command to install Terraform:

```sh
make install
```

### 2. Plan Terraform

Run the following command to plan Terraform:

```sh
make plan
```


### 3. Apply/Deploy Terraform

Run the following command to apply Terraform:

```sh
make apply
```


### 4. Destroy Terraform

Run the following command to destroy Terraform:

```sh
make destroy
```