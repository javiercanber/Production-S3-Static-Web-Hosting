data "aws_iam_policy_document" "cloudfront_s3_access" {
  statement {
    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
        "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.portfolio_bucket.arn}/*"
    ]

    condition {
        test = "StringEquals"
        variable = "AWS:SourceArn"
        values = [var.s3_distribution_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.portfolio_bucket.id
  policy = aws_iam_policy_document.cloudfront_s3_access.json
}