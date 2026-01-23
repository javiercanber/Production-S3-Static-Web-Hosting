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

  source = "./Route53_base"

  domain_validation_options = module.acm.domain_validation_options
  domain_name = var.domain_name
  S3_distribution_domain_name = module.cloudfront.s3_distribution_domain_name
  S3_distribution_hosted_zone_id = module.cloudfront.s3_distribution_hosted_zone_id
  address_line = var.address_line
  email = var.email
  zip_code = var.zip_code
  state = var.state
  phone_number = var.phone_number

}

module "dns_traffic" {

  source = "./dns_traffic"

  hosted_zone_id = module.route53.hosted_zone_id
  domain_name = module.route53.domain_name
  S3_distribution_domain_name = module.cloudfront.s3_distribution_domain_name
  S3_distribution_hosted_zone_id = module.cloudfront.s3_distribution_hosted_zone_id
  
}

module "acm" {

  source = "./ACM"

  s3_cert_validation_record = module.route53.s3_cert_validation_record
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
  s3_distribution_arn = module.cloudfront.s3_distribution_arn

}

output "DATOS_PARA_CLOUDFLARE" {
  value = {
    cname_name  = tolist(module.acm.domain_validation_options)[0].resource_record_name
    cname_value = tolist(module.acm.domain_validation_options)[0].resource_record_value
  }
}