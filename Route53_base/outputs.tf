output "domain_name" {
  value = aws_route53domains_domain.portfolio_domain.domain_name
}

output "s3_cert_validation_record" {
  value = aws_route53_record.cert_validation_record
}

output "hosted_zone_id" {
  value = aws_route53domains_domain.portfolio_domain.hosted_zone_id
}