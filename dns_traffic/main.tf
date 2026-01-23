# Create a Route53 Alias Record to point to CloudFront Distribution
resource "aws_route53_record" "portfolio_record" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.S3_distribution_domain_name
    zone_id                = var.S3_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}