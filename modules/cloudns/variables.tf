variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}

variable "zone_name" {
  type = string
  description = "The domain name to register"
}