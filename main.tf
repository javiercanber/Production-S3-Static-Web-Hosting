module "cloudfront" {

  source = "./modules/cloudfront"

  zone_name = module.route53.zone_name
  s3_bucket_id = module.s3.s3_bucket_id
  s3_domain_name = module.s3.s3_domain_name
  s3_certificate = module.acm.s3_certificate
  s3_cert_valid_arn = module.acm.s3_cert_valid
  WAF_s3_acl = module.waf.WAF_s3_acl

}


module "route53" {

  source = "./modules/Route53_base"

  zone_name = var.zone_name

}

module "cloudns" {

  source = "./modules/cloudns"

  providers = {
    cloudns = cloudns
  }

  domain_validation_options = module.acm.domain_validation_options
  zone_name = module.route53.zone_name
  cloudns_auth_id = var.cloudns_auth_id
  cloudns_auth_password = var.cloudns_auth_password
}

module "acm" {

  source = "./modules/ACM"

  validation_record_fqdns = module.cloudns.validation_record_fqdns
  region_cloudfront = var.region_cloudfront
  zone_name = module.route53.zone_name

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