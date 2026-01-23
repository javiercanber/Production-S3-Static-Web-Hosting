# Register the domain name
resource "aws_route53_zone" "portfolio_domain" {
  name = var.domain_name
}

# Create CNAME record to validate the domain
resource "aws_route53_record" "cert_validation_record" {
  count = 1

  allow_overwrite = true
  name            = tolist(var.domain_validation_options)[0].resource_record_name
  records         = [tolist(var.domain_validation_options)[0].resource_record_value]
  type            = tolist(var.domain_validation_options)[0].resource_record_type

  ttl             = 60
  zone_id         = aws_route53_zone.portfolio_domain.zone_id
}