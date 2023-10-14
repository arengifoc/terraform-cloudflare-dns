# Cloudflare DNS module

This module allows provisioning and managing Cloudflare DNS zones and records

## Examples

| Name                            | Version                         |
| ------------------------------- | ------------------------------- |
| [complete](./examples/complete) | Most of the features documented |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone.selected](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Account ID to manage the zone resource in. | `string` | n/a | yes |
| <a name="input_create_zone"></a> [create\_zone](#input\_create\_zone) | Whether to create the DNS zone or not. | `bool` | `false` | no |
| <a name="input_paused"></a> [paused](#input\_paused) | Whether this zone is paused (traffic bypasses Cloudflare). | `bool` | `false` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | The name of the commercial plan to apply to the zone. Available values: free, lite, pro, pro\_plus, business, enterprise, partners\_free, partners\_pro, partners\_business, partners\_enterprise. | `string` | `"pro"` | no |
| <a name="input_records"></a> [records](#input\_records) | Map of DNS records to create | `any` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | A full zone implies that DNS is hosted with Cloudflare. A partial zone is typically a partner-hosted zone or a CNAME setup | `string` | `"full"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | DNS zone name which will be added.. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Zone ID |
| <a name="output_name"></a> [name](#output\_name) | Zone name |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | Zone name servers |
| <a name="output_records"></a> [records](#output\_records) | Map of DNS records created |
| <a name="output_status"></a> [status](#output\_status) | Zone status |