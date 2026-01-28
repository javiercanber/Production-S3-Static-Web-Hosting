# Register Route 53 Zone
resource "aws_route53_zone" "portfolio_domain" {
  name = var.zone_name
}