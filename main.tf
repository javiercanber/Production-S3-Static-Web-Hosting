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

module "cloudfront" {

  source = "./cloudfront"

  domain_name = module.s3.s3_domain_name
  s3_bucket_id = module.s3.s3_bucket_id
  s3_domain_name = module.route53.domain_name
  s3_certificate = module.acm.s3_certificate
  s3_cert_valid_arn = module.acm.s3_cert_valid
  WAF_s3_acl = module.waf.WAF_s3_acl

}


module "route53" {

  source = "./Route53"

  domain_validation_options = var.domain_validation_options
  domain_name = module.s3.s3_domain_name
  S3_distribution_domain_name = module.cloudfront.s3_distribution_domain_name
  S3_distribution_hosted_zone_id = module.cloudfront.s3_distribution_hosted_zone_id
  address_line = var.address_line
  email = var.email
  zip_code = var.zip_code
  state = var.state
  phone_number = var.phone_number


}

module "acm" {

  source = "./ACM"

  s3_cert_validation_record = var.domain_validation_options
  region_cloudfront = var.region_cloudfront
  domain_name = module.route53.domain_name

}

module "waf" {

  source = "./WAF"

  region_cloudfront = var.region_cloudfront
}

module "s3" {
  
  source = "./s3"

  s3_bucket_name = var.s3_bucket_name
  s3_distribution_arn = var.s3_distribution_arn

}

