output "domain_name" {
  value = aws_route53_zone.portfolio_domain.name
}

output "s3_cert_validation_record" {
  value = aws_route53_record.cert_validation_record[*].fqdn
}

output "hosted_zone_id" {
  value = aws_route53_zone.portfolio_domain.zone_id
}

output "name_serers" {
  value = aws_route53_zone.portfolio_domain.name_servers
}