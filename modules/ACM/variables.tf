variable "zone_name" {
  type = string
  description = "The domain name to register"
}

variable "region_cloudfront" {
    type = string
    description = "CloudFront specific Region"
}

variable "validation_record_fqdns" {
  type = list(string)
  description = "S3 Certification validation record"
}