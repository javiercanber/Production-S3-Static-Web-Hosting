module "cloudfront" {

  source = "./modules/cloudfront"

  zone_name = module.cloudns.zone_name
  s3_bucket_id = module.s3.s3_bucket_id
  s3_domain_name = module.s3.s3_domain_name
  s3_certificate = module.acm.s3_certificate
  s3_cert_valid_arn = module.acm.s3_cert_valid
  WAF_s3_acl = module.waf.WAF_s3_acl

}

module "cloudns" {

  source = "./modules/cloudns"

  providers = {
    cloudns = cloudns
  }

  s3_distribution_domain_name = module.cloudfront.s3_distribution_domain_name
  domain_validation_options = module.acm.domain_validation_options
  zone_name = var.zone_name
  CLOUDNS_AUTH_ID = var.CLOUDNS_AUTH_ID
  CLOUDNS_AUTH_PASSWORD = var.CLOUDNS_AUTH_PASSWORD
}

module "acm" {

  source = "./modules/ACM"

  validation_record_fqdns = module.cloudns.validation_record_fqdns
  region_cloudfront = var.region_cloudfront
  zone_name = var.zone_name

}

module "waf" {

  source = "./modules/WAF"

  region_cloudfront = var.region_cloudfront
}

module "s3" {
  
  source = "./modules/s3"

  s3_bucket_name = var.s3_bucket_name
  s3_distribution_arn = module.cloudfront.s3_distribution_arn

}