variable "aws_region" {
  type        = string
  description = "AWS region for the lab."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "project_name" {
  type        = string
  description = "Project name used for resource naming."
}

variable "owner" {
  type        = string
  description = "Owner tag value."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR range for the VPC."
}

variable "enable_eks" {
  type        = bool
  description = "Whether to create EKS."
}

variable "eks_cluster_version" {
  type        = string
  description = "EKS Kubernetes version."
}
