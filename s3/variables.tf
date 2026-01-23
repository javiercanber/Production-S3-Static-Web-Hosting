variable "s3_bucket_name" {
  type = string
  description = "The name of the S3 bucket to host the website"
}

variable "s3_distribution_arn" {
  type = string
  description = "The ARN of the CloudFront distribution"
}