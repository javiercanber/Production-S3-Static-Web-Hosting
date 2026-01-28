output "WAF_s3_acl" {
  value = aws_wafv2_web_acl.WAF_s3_acl.arn
}