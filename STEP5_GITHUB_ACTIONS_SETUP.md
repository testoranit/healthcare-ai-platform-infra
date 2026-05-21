# Step 5 Terraform GitHub Actions Setup

Create these GitHub settings before running the Terraform workflows.

## Repository variables

In `testoranit/healthcare-ai-platform-infra`, add:

```text
AWS_ACCOUNT_ID = 021655150740
AWS_REGION = ap-south-1
TF_STATE_BUCKET = healthcare-ai-tfstate-021655150740
TF_LOCK_TABLE = healthcare-ai-tf-locks
```

## Environments

Create these environments:

```text
dev
stage
prod
```

Recommended protection:

- `dev`: no manual approval
- `stage`: required reviewer
- `prod`: required reviewer

The AWS OIDC trust policy created in Step 2 expects these environment names exactly.
