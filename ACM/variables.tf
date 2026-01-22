variable "domain_name" {
  type = string
  description = "The domain name to register"
}

variable "region" {
    type = string
    description = "CloudFront specific Region"
}

variable "s3_cert_validation_record" {
  type = list(string)
  description = "S3 Certification validation record"
}