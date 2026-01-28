#Terraform CI/CD Pipeline

A fully automated Terraform CI/CD pipeline for AWS S3 deployments, designed for safe local testing with LocalStack and GitHub Actions. This project demonstrates core DevOps skills like infrastructure automation, modular Terraform code, CI/CD, and secure testing — essential for real-world engineering environments.

##Table of Contents

- Project Overview

- Project Structure

- Features

- Tech Stack

- Getting Started

- CI/CD Workflow

- Best Practices Followed

- Security & Safe Testing

- Contributing

##Project Overview

This project automates the provisioning of AWS S3 buckets and deploys static websites to them.
It uses LocalStack to emulate AWS locally, so you can safely test infrastructure and CI/CD workflows without using a real AWS account.

The pipeline automatically formats and validates Terraform code, applies infrastructure per environment (dev / prod), and runs smoke tests to ensure deployments work as expected.

##Project Structure
terraform-ci-cd/
├─ terraform/                   # Root Terraform folder
│  ├─ main.tf                   # Boilerplate for provider and modules
│  ├─ variables.tf              # Global variables
│  ├─ outputs.tf                # Outputs to expose key values
│  ├─ backend.tf                # Backend config (if needed)
│  ├─ dev.tfvars                # Development environment variables
│  ├─ prod.tfvars               # Production environment variables
│  └─ modules/
│     └─ s3_bucket/
│        ├─ main.tf             # S3 bucket & object resources
│        ├─ variables.tf        # Module-specific variables
│        └─ outputs.tf          # Module-specific outputs
├─ tests/
│  └─ smoke_test.sh             # Script to test S3 bucket deployment
├─ .github/workflows/
│  └─ deploy.yaml               # CI/CD workflow with GitHub Actions
├─ app/
│  └─ index.html                # Example static website to deploy
└─ README.md

##Features

✅ Automated provisioning of AWS S3 buckets using Terraform modules

✅ Environment-specific configurations (dev / prod)

✅ Local testing using LocalStack

✅ CI/CD automation with GitHub Actions

✅ Smoke tests to verify deployments automatically

✅ Secure credentials management using GitHub Secrets

##Tech Stack

Terraform — Infrastructure as Code (modular)

LocalStack — Local AWS emulation for safe testing

GitHub Actions — CI/CD automation

Bash — Smoke test scripting

HTML/CSS — Example static site deployment

##Getting Started
###Prerequisites

Docker

Terraform 1.5+

Git

Bash (Git Bash on Windows)

###Clone the Repository
git clone https://github.com/<username>/terraform-ci-cd.git
cd terraform-ci-cd/terraform

###Run Locally with LocalStack

Start LocalStack:

docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack


###Initialize Terraform:

terraform init


###Validate Terraform configuration:

terraform fmt -check
terraform validate


###Plan and apply:

terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars -auto-approve


###Run smoke test:

bash ../tests/smoke_test.sh myapp dev

###CI/CD Workflow

The GitHub Actions workflow (deploy.yaml) does the following automatically on push to dev or main:

Checkout repository

Setup Terraform

Format and validate Terraform code

Initialize Terraform

Plan and apply infrastructure (with environment-specific variables)

Run smoke tests

Show Terraform outputs

Best Practices Followed

Modular Terraform code — reusable resources across environments

Variables & tfvars files — separate configuration from logic

Outputs — expose key values like bucket URLs

Automatic validation & formatting — maintain high code quality

Environment separation — dev vs prod

Security & Safe Testing

LocalStack emulates AWS locally for cost-free and safe testing

GitHub Secrets store fake AWS credentials securely

No real AWS resources are required to run the pipeline

Contributing

Contributions are welcome!

Fork the repo

Open a pull request

Ensure Terraform code passes fmt and validate
