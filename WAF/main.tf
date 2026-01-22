provider "aws" {
  alias = "virginia"
  region = var.region
}

resource "aws_wafv2_web_acl" "WAF_s3_acl" {
  name     = "portfolio-waf"
  scope    = "CLOUDFRONT"
  provider = aws.virginia

  default_action {
    allow {}
  }

  # Rule 1: OWASP
  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "WAFCommonRule"
      sampled_requests_enabled   = true
    }
  }

  # Rule 2: Ip Reputation List
  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "WAFIPReputation"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "portfolio-waf-main"
    sampled_requests_enabled   = true
  }
}