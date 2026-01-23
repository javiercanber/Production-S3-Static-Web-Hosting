variable "hosted_zone_id" {
  type        = string
  description = "ID de la zona alojada en Route53 (la del dominio)"
}

variable "domain_name" {
  type        = string
  description = "El nombre del dominio (ej. mi-portfolio.com)"
}

variable "S3_distribution_domain_name" {
  type = string
  description = "CloudFront distribution domain name"
}

variable "S3_distribution_hosted_zone_id" {
  type = string
  description = "CloudFront distribution hosted zone id"
}