variable "create_zone" {
  description = "Whether to create the DNS zone or not."
  type        = bool
  default     = false
}

variable "account_id" {
  description = "Account ID to manage the zone resource in."
  type        = string
}

variable "zone" {
  description = "DNS zone name which will be added.."
  type        = string
}

variable "paused" {
  description = "Whether this zone is paused (traffic bypasses Cloudflare)."
  type        = bool
  default     = false
}

variable "plan" {
  description = "The name of the commercial plan to apply to the zone. Available values: free, lite, pro, pro_plus, business, enterprise, partners_free, partners_pro, partners_business, partners_enterprise."
  type        = string
  default     = "pro"
}

variable "type" {
  description = "A full zone implies that DNS is hosted with Cloudflare. A partial zone is typically a partner-hosted zone or a CNAME setup"
  type        = string
  default     = "full"
}

variable "records" {
  description = "Map of DNS records to create"
  type        = any
  default     = {}
}
