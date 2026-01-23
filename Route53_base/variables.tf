variable "domain_name" {
  type = string
  description = "The domain name to register"
}
variable "address_line" {
  type = string
  description = "Address line 1 for domain registration"
}

variable "email" {
  type = string
  description = "Email address for domain registration"
}

variable "phone_number" {
  type = number
  description = "Phone number for domain registration"
}

variable "state" {
  type = string
  description = "State for domain registration"
}

variable "zip_code" {
  type = number
  description = "Zip Code for domain registration"
}

variable "S3_distribution_domain_name" {
  type = string
  description = "CloudFront distribution domain name"
}

variable "S3_distribution_hosted_zone_id" {
  type = string
  description = "CloudFront distribution hosted zone id"
}

variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}