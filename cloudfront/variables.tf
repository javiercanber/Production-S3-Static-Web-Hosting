variable "s3_bucket_access" {
    type = string
    default = "S3 Access for CloudFront"
}

variable "s3_bucket_id" {
  type = string
  description = "The ID of the S3 bucket to be used as CloudFront origin"
}

variable "domain_name" {
  type = string
  description = "The domain name for the CloudFront distribution"
}