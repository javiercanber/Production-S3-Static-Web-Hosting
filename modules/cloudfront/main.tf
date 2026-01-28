# Create CloudFront access control to S3
resource "aws_cloudfront_origin_access_control" "s3_access" {
  name                              = var.s3_bucket_access
  description                       = "S3 bucket access to allow CloudFront to fetch content"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

locals {
  s3_origin_id = "s3-${local.my_domain}-origin"
  my_domain    = var.zone_name
}
# Create CloudFront distribution for the S3 bucket
resource "aws_cloudfront_distribution" "s3_distribution" {

  origin {

    domain_name              = var.s3_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
    origin_id                = local.s3_origin_id

  }

    enabled             = true
    is_ipv6_enabled     = true
    comment             = "Portfolio Website Index"
    default_root_object = "index.html"

    web_acl_id = var.WAF_s3_acl

  aliases = [var.zone_name]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

    restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "ES"]
    }
  }

   viewer_certificate {
    acm_certificate_arn = var.s3_cert_valid_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}