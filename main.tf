## --------------------------------------------------------
## Locals
## --------------------------------------------------------
locals {
  zone_id           = var.create_zone ? cloudflare_zone.this[0].id : data.cloudflare_zone.selected[0].id
  zone_name         = var.create_zone ? cloudflare_zone.this[0].zone : var.zone
  zone_name_servers = var.create_zone ? cloudflare_zone.this[0].name_servers : data.cloudflare_zone.selected[0].name_servers
  zone_status       = var.create_zone ? cloudflare_zone.this[0].status : data.cloudflare_zone.selected[0].status
}

## --------------------------------------------------------
## Data Sources
## --------------------------------------------------------
data "cloudflare_zone" "selected" {
  count = var.create_zone ? 0 : 1

  account_id = var.account_id
  name       = var.zone
}

## --------------------------------------------------------
## Resources
## --------------------------------------------------------
resource "cloudflare_zone" "this" {
  count = var.create_zone ? 1 : 0

  account_id = var.account_id
  paused     = var.paused
  plan       = var.plan
  type       = var.type
  zone       = var.zone
}

resource "cloudflare_record" "this" {
  for_each = var.records

  allow_overwrite = try(each.value.allow_overwrite, false)
  comment         = try(each.value.comment, null)
  name            = each.value.name
  priority        = try(each.value.priority, null)
  proxied         = try(each.value.proxied, true)
  tags            = try(each.value.tags, null)
  ttl             = try(each.value.proxied, true) ? 1 : try(each.value.ttl, 43200)
  type            = each.value.type
  value           = try(each.value.value, null)
  zone_id         = local.zone_id

  dynamic "data" {
    for_each = try(length(keys(each.value.data)), 0) > 0 ? [1] : []

    content {
      algorithm      = try(data.value.algorithm, null)
      altitude       = try(data.value.altitude, null)
      certificate    = try(data.value.certificate, null)
      content        = try(data.value.content, null)
      digest         = try(data.value.digest, null)
      digest_type    = try(data.value.digest_type, null)
      fingerprint    = try(data.value.fingerprint, null)
      flags          = try(data.value.flags, null)
      key_tag        = try(data.value.key_tag, null)
      lat_degrees    = try(data.value.lat_degrees, null)
      lat_direction  = try(data.value.lat_direction, null)
      lat_minutes    = try(data.value.lat_minutes, null)
      lat_seconds    = try(data.value.lat_seconds, null)
      long_degrees   = try(data.value.long_degrees, null)
      long_direction = try(data.value.long_direction, null)
      long_minutes   = try(data.value.long_minutes, null)
      long_seconds   = try(data.value.long_seconds, null)
      matching_type  = try(data.value.matching_type, null)
      name           = try(data.value.name, null)
      order          = try(data.value.order, null)
      port           = try(data.value.port, null)
      precision_horz = try(data.value.precision_horz, null)
      precision_vert = try(data.value.precision_vert, null)
      preference     = try(data.value.preference, null)
      priority       = try(data.value.priority, null)
      proto          = try(data.value.proto, null)
      protocol       = try(data.value.protocol, null)
      public_key     = try(data.value.public_key, null)
      regex          = try(data.value.regex, null)
      replacement    = try(data.value.replacement, null)
      selector       = try(data.value.selector, null)
      service        = try(data.value.service, null)
      size           = try(data.value.size, null)
      tag            = try(data.value.tag, null)
      target         = try(data.value.target, null)
      type           = try(data.value.type, null)
      usage          = try(data.value.usage, null)
      value          = try(data.value.value, null)
      weight         = try(data.value.weight, null)
    }
  }
}
