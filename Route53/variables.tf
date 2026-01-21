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

variable "portfolio_elb" {
    type = string
    description = "The ELB for the portfolio application"
}