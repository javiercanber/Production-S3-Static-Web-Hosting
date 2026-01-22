# Register a new domain name
resource "aws_route53domains_domain" "portfolio_domain" {
  domain_name = var.domain_name
  auto_renew  = false

  admin_contact {
    address_line_1    = var.address_line
    email             = var.email
    first_name        = "Francisco Javier"
    last_name         = "Candela Berrocal"
    phone_number      = var.phone_number
    state             = var.state
    zip_code          = var.zip_code
  }

  registrant_contact {
    address_line_1    = var.address_line
    email             = var.email
    first_name        = "Francisco Javier"
    last_name         = "Candela Berrocal"
    phone_number      = var.phone_number
    state             = var.state
    zip_code          = var.zip_code
  }

  tech_contact {
    address_line_1    = var.address_line
    email             = var.email
    first_name        = "Francisco Javier"
    last_name         = "Candela Berrocal"
    phone_number      = var.phone_number
    state             = var.state
    zip_code          = var.zip_code
  }
}

# Create a Route53 Alias Record to point to CloudFront Distribution
resource "aws_route53_record" "portfolio_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.S3_distribution_domain_name
    zone_id                = var.S3_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}

# Create CNAME record to validate the domain
resource "aws_route53_record" "cert_validation_record" {
  for_each = {
    for dvo in var.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.selected.zone_id
}