output "validation_record_fqdns" {
  value = [for record in cloudns_dns_record.cert_validation : "${record.host}.${var.zone_name}"]
}