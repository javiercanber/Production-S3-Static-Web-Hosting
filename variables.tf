variable "region" {
  type = string
  description = "AWS Region"
}

variable "project" {
  type    = string
  description = "Project tag for AWS resources"
}

variable "environment" {
  type    = string
  description = "Environment tag for AWS resources"
}