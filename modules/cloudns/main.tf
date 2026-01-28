# Registro para validación de certificado ACM
resource "cloudns_dns_record" "cert_validation" {
  for_each = var.domain_validation_options

  zone_name = var.zone_name
  # Limpieza del host: quitamos el dominio para que ClouDNS lo acepte
  host      = replace(each.value.resource_record_name, ".${var.zone_name}.", "")
  type      = each.value.resource_record_type
  value     = each.value.resource_record_value
  ttl       = 60
}

# Registro ALIAS para el dominio principal
resource "cloudns_dns_record" "alias" {
  zone_name = var.zone_name
  host      = "javiercanbe" # O vacío si es el dominio raíz directamente
  type      = "ALIAS"
  value     = var.zone_name
  ttl       = 60
}