output "validation_record_fqdns" {
  value = [for record in cloudns_dns_record.cert_validation : "${record.name}.${var.zone_name}"]
}