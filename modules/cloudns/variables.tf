variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}

variable "zone_name" {
  type = string
  description = "The domain name to register"
}

variable "CLOUDNS_AUTH_ID" {
  type = string
  sensitive = true
}

variable "CLOUDNS_AUTH_PASSWORD" {
  type = string
  sensitive = true
}