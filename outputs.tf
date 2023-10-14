output "id" {
  description = "Zone ID"
  value       = local.zone_id
}

output "status" {
  description = "Zone status"
  value       = local.zone_status
}

output "name_servers" {
  description = "Zone name servers"
  value       = local.zone_name_servers
}

output "name" {
  description = "Zone name"
  value       = local.zone_name
}

output "records" {
  description = "Map of DNS records created"
  value = {
    for key, value in cloudflare_record.this :
    key => {
      created_on  = value.created_on
      hostname    = value.hostname
      id          = value.id
      modified_on = value.modified_on
      proxiable   = value.proxiable
    }
  }
}
