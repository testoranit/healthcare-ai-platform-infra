data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)
  name = "${var.project_name}-${var.environment}"

  common_tags = {
    Project            = var.project_name
    Environment        = var.environment
    Owner              = var.owner
    ManagedBy          = "terraform"
    DataClassification = "synthetic-healthcare"
    CostCenter         = "ai-lab"
  }
}

module "network" {
  source = "../../modules/network"

  name       = local.name
  vpc_cidr   = var.vpc_cidr
  azs        = local.azs
  aws_region = var.aws_region
}

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = "${local.name}-agent"
}

module "security_baseline" {
  source     = "../../modules/security-baseline"
  name       = local.name
  aws_region = var.aws_region
}

module "eks" {
  count  = var.enable_eks ? 1 : 0
  source = "../../modules/eks"

  name               = local.name
  cluster_version    = var.eks_cluster_version
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
}

module "bedrock_rag" {
  source      = "../../modules/bedrock-rag"
  name        = local.name
  environment = var.environment
}

module "observability" {
  source = "../../modules/observability"
  name   = local.name
}
