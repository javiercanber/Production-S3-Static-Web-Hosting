# Create CloudFront access control to S3
resource "aws_cloudfront_origin_access_control" "s3_access" {
  name                              = var.s3_bucket_access
  description                       = "S3 bucket access to allow CloudFront to fetch content"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

locals {
  s3_origin_id = var.s3_bucket_id
  my_domain    = "example.com"
}
# Create CloudFront distribution for the S3 bucket
resource "aws_cloudfront_distribution" "s3_distribution" {

  origin {

    domain_name              = aws_s3_bucket.portfolio_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
    origin_id                = local.s3_origin_id

  }

    enabled             = true
    is_ipv6_enabled     = true
    comment             = "Portfolio Website Index"
    default_root_object = "index.html"

  aliases = [var.domain_name]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
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
    acm_certificate_arn = data.aws_acm_certificate.my_domain.arn
    ssl_support_method  = "sni-only"
  }
}