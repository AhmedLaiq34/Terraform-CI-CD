# Terraform CI/CD Pipeline with LocalStack

This project demonstrates a **CI/CD pipeline for Terraform** using **LocalStack** (AWS cloud emulator) and **GitHub Actions**. It deploys a simple S3 bucket with a sample `index.html` and runs a smoke test automatically.

---

## Features

- Infrastructure as Code with Terraform
- Separate environments: `dev` and `prod` (via `dev.tfvars` and `prod.tfvars`)
- Automated CI/CD with GitHub Actions
- Local AWS emulation using LocalStack (no real AWS account needed)
- Smoke tests to validate deployments
- Secrets management via GitHub Secrets

---

## Project Structure

terraform-ci-cd/
├─ terraform/
│ ├─ main.tf
│ ├─ variables.tf
│ ├─ outputs.tf
│ ├─ backend.tf
│ ├─ dev.tfvars
│ ├─ prod.tfvars
│ └─ modules/
│ └─ s3_bucket/
│ ├─ main.tf
│ ├─ variables.tf
│ └─ outputs.tf
├─ app/
│ └─ index.html
├─ tests/
│ └─ smoke_test.sh
├─ .github/workflows/deploy.yml
├─ .gitignore
└─ README.md


---

## How to Run Locally

1. **Install Terraform** (v1.5.0+)
2. **Install Docker** and make sure it’s running
3. **Start LocalStack**:

```bash
docker run --rm -it -p 4566:4566 localstack/localstack
Deploy Terraform:

cd terraform
terraform init
terraform apply -var-file=dev.tfvars -auto-approve
Run Smoke Test:

bash ../tests/smoke_test.sh myapp dev