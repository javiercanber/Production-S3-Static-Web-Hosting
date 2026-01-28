variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}

variable "zone_name" {
  type = string
  description = "The domain name to register"
}

variable "cloudns_auth_id" {
  type = string
  sensitive = true
}

variable "cloudns_auth_password" {
  type = string
  sensitive = true
}