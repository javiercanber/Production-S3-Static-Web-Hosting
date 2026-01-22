# Specific provider for CloudFront
provider "aws" {
  alias  = "virginia"  
  region = var.region_cloudfront
}

# Create a certificate in ACM for the domain
resource "aws_acm_certificate" "s3_certificate" {
  provider          = aws.virginia 
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "s3_cert_valid" {
  provider                = aws.virginia
  certificate_arn         = aws_acm_certificate.s3_certificate.arn
  validation_record_fqdns = [for record in var.s3_cert_validation_record : record.fqdn]
}