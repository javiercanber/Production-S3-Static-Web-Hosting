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
resource "aws_elb" "portfolio_elb" {
  name               = var.portfolio_elb
  internal           = false
  availability_zones = ["eu-west-1b"]

  listener {
    instance_port = 443
    instance_protocol = "https"
    lb_port = 443
    lb_protocol = "https"
  }
}

resource "aws_route53_record" "portfolio_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_elb.portfolio_elb.dns_name
    zone_id                = aws_elb.portfolio_elb.zone_id
    evaluate_target_health = false
  }
}