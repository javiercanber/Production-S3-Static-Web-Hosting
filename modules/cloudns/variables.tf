variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}

variable "s3_distribution_domain_name" {
  type = string
  description = "Define the distribute domain name in CloudFront"
}

variable "zone_name" {
  type = string
  description = "The domain name to register"
}

variable "CLOUDNS_AUTH_ID" {
  type = string
  sensitive = true
  description = "AUTH ID for Cloudns provider"
}

variable "CLOUDNS_AUTH_PASSWORD" {
  type = string
  sensitive = true
  description = "AUTH Password for Cloudns provider"
}