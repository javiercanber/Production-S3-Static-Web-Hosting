# Terraform configuration for AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
  }
}
}
# Configure the AWS Provider
provider "aws" {
  region = var.region

    default_tags {
      tags = {
        Project = var.project
        Environment = var.environment
      }
    }
}