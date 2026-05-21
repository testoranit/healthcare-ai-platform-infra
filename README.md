# Healthcare AI Platform Infrastructure

Terraform infrastructure for the cost-aware Healthcare AI RAG Platform lab.

## What this creates

- VPC with public and private subnets across 3 AZs
- NAT Gateway and private routing
- VPC endpoints for common AWS services
- ECR repository for the AI agent container
- Security baseline: CloudTrail, GuardDuty, Security Hub, IAM Access Analyzer
- Optional EKS cluster foundation
- Placeholder module outputs for Bedrock RAG values used in later steps

## First run

Run from your local CLI after Step 2 bootstrap is complete.

```powershell
cd "C:\Users\SSSS\Documents\AI Lab2\healthcare-ai-platform-infra\envs\dev"

terraform init -backend-config=backend.hcl
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan
```

Apply only when the plan looks right:

```powershell
terraform apply tfplan
```

## Cost note

`enable_eks` is enabled in `dev` because Step 3 is meant to stand up the cloud platform foundation. EKS, NAT Gateway, and later OpenSearch Serverless/Bedrock can create real AWS cost. Destroy when not practicing:

```powershell
terraform destroy
```
