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