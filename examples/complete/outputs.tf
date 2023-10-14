output "id" {
  description = "Zone ID"
  value       = module.dns.id
}

output "status" {
  description = "Zone status"
  value       = module.dns.status
}

output "name_servers" {
  description = "Zone name servers"
  value       = module.dns.name_servers
}

output "name" {
  description = "Zone name"
  value       = module.dns.name
}

output "records" {
  description = "Map of DNS records created"
  value       = module.dns.records
}
