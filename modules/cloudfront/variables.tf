variable "s3_bucket_access" {
    type = string
    default = "S3 Access for CloudFront"
}

variable "s3_bucket_id" {
  type = string
  description = "The ID of the S3 bucket to be used as CloudFront origin"
}

variable "zone_name" {
  type = string
  description = "The domain name for the CloudFront distribution"
}

variable "s3_domain_name" {
  type = string
  description = "The regional domain name of the S3 bucket"
}

variable "s3_certificate" {
  type = string
  description = "The ACM certificate ARN for the CloudFront distribution"
}

variable "s3_cert_valid_arn" {
  type = string
  description = "S3 certification validation"
}

variable "WAF_s3_acl" {
  type = string
  description = "WAF ACL to S3 website"
}