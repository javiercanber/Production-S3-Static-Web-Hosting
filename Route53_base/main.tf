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

# Create CNAME record to validate the domain
resource "aws_route53_record" "cert_validation_record" {
  count = 1

  allow_overwrite = true
  name            = tolist(var.domain_validation_options)[0].resource_record_name
  records         = [tolist(var.domain_validation_options)[0].resource_record_value]
  type            = tolist(var.domain_validation_options)[0].resource_record_type

  ttl             = 60
  zone_id         = aws_route53domains_domain.portfolio_domain.hosted_zone_id
}