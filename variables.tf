variable "region" {
  type = string
  description = "AWS Region"
}

variable "region_cloudfront" {
  type = string
  description = "CloudFront Region"
}

variable "project" {
  type    = string
  description = "Project tag for AWS resources"
}

variable "environment" {
  type    = string
  description = "Environment tag for AWS resources"
}

variable "s3_bucket_access" {
  type = string
  description = "Name of the CloudFront S3 Access"
}

variable "s3_bucket_name" {
  type = string
  description = "Bucket name from S3 service"
}

variable "s3_distribution_arn" {
  type = string
  description = "The ARN of the CloudFront distribution"
}

variable "domain_validation_options" {
  type = any
  description = "Certificate domain validation options"
}

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