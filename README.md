# Terraform CI/CD Pipeline with GitHub Actions and OIDC

## Overview
This project demonstrates a secure, production-style CI/CD pipeline for Terraform using GitHub Actions and AWS OpenID Connect (OIDC).

Infrastructure is provisioned automatically without storing long-lived AWS credentials, using short-lived identity federation.

---

## Architecture

GitHub Push  
↓  
GitHub Actions Workflow  
↓  
OIDC Authentication  
↓  
AWS IAM Role  
↓  
Terraform (Init / Plan / Apply)  
↓  
S3 (Remote State) + DynamoDB (State Locking)  
↓  
AWS Resources (S3 Bucket)

---

## How It Works

1. Code is pushed to GitHub
2. GitHub Actions workflow is triggered
3. OIDC is used to securely assume an AWS IAM role
4. Terraform runs:
   - terraform init
   - terraform plan
   - terraform apply
5. Infrastructure is created or updated in AWS

---

## Key Features

- Secure authentication using OIDC (no AWS access keys)
- Automated Terraform deployments via GitHub Actions
- Remote Terraform state stored in S3
- DynamoDB state locking to prevent concurrent modifications
- Full lifecycle management (deploy + destroy workflows)

---

## State Management

This project uses remote state stored in Amazon S3 with DynamoDB state locking.

- S3 stores Terraform state centrally
- DynamoDB prevents concurrent Terraform operations
- Ensures consistency across local and CI/CD environments

---

## CI/CD Workflow

The pipeline includes:

- terraform init
- terraform plan
- terraform apply
- Identity verification via aws sts get-caller-identity

---

## Destroy Workflow

A manual destroy workflow is included:

- Triggered via GitHub Actions (workflow_dispatch)
- Empties S3 buckets before deletion
- Executes terraform destroy safely

---

## Demo

### Workflow Execution
- GitHub Actions run with successful steps

### Terraform Apply
- Infrastructure created automatically

### AWS Resource
- S3 bucket provisioned via pipeline

---

## Security Design

- No long-lived credentials stored in GitHub
- IAM role assumed via OIDC federation
- Least privilege access recommended
- Encrypted remote state storage

---

## Engineering Highlights

- Implemented CI/CD pipeline using GitHub Actions
- Configured OIDC for secure AWS authentication
- Automated Terraform infrastructure deployment
- Implemented remote state using S3
- Added DynamoDB locking for safe concurrent execution
- Built full lifecycle workflow (deploy + destroy)

---

## Future Enhancements

- Add environment separation (dev / prod)
- Introduce approval gates for production deploys
- Implement Terraform plan on pull requests
- Add monitoring and alerting (CloudWatch)

---

## Lessons Learned

- OIDC eliminates the need for static credentials
- Terraform state must be centralized for CI/CD workflows
- State locking is critical for preventing race conditions
- Infrastructure automation requires both deploy and destroy workflows
