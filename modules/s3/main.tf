# Define S3 bucket for website hosting
resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = var.s3_bucket_name
}

# Upload website files to S3 Bucket
resource "aws_s3_object" "website_objects" {
  for_each = fileset("${path.module}/../../website", "**")

  bucket = var.s3_bucket_name
  key    = each.value
  source = "${path.module}/../../website/${each.value}"

  etag = filemd5("${path.module}/../../website/${each.value}")
}

# Configure the bucket for website hosting
resource "aws_s3_bucket_website_configuration" "portfolio_website" {
  bucket = aws_s3_bucket.portfolio_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}