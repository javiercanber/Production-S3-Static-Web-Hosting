# Set Cloudns provider
terraform {
  required_providers {
    cloudns = {
      source = "cloudns/cloudns"
    }
  }
}

locals {
  # Esto convierte el set inestable en un mapa estable dentro del módulo
  # Usamos el domain_name como clave porque Terraform ya lo conoce
  clean_validation_options = {
    for dvo in var.domain_validation_options : dvo.domain_name => dvo
  }
}

# Registro para validación de certificado ACM
resource "cloudns_dns_record" "cert_validation" {
  for_each = local.clean_validation_options

  zone = var.zone_name
  # Limpieza del host: quitamos el dominio para que ClouDNS lo acepte
  name      = replace(each.value.resource_record_name, ".${var.zone_name}.", "")
  type      = each.value.resource_record_type
  value     = each.value.resource_record_value
  ttl       = 60
}

# Registro ALIAS para el dominio principal
resource "cloudns_dns_record" "alias" {
  zone = var.zone_name
  name      = "javiercanbe" # O vacío si es el dominio raíz directamente
  type      = "ALIAS"
  value     = var.zone_name
  ttl       = 60
}