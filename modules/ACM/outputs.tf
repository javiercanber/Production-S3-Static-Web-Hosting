output "s3_certificate" {
  value = aws_acm_certificate.s3_certificate.arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.s3_certificate.domain_validation_options
}

output "s3_cert_valid" {
  value = aws_acm_certificate_validation.s3_cert_valid.certificate_arn
}