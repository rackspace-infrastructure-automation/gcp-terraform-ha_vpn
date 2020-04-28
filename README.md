# gcp-terraform-ha_vpn

This module creates a [HA VPN](https://cloud.google.com/vpn/docs/how-to/choosing-a-vpn#ha-vpn) on Google Cloud with 2 interfaces.

## Basic Usage

```
module "ha_vpn" {
  source = "git@github.com:rackspace-infrastructure-automation/gcp-terraform-ha_vpn/?ref=master"

  network                   = "default"
  region                    = "europe-west2"
  cloud_router_name         = "vpn-rtr"
  gateway_name              = "some-gateway"
  resource_prefix           = "some-prefix"
  shared_secrets            = ["blah", "bleh"]
  peer_ips                  = ["1.1.1.1", "2.2.2.2"]
  peer_asn                  = 65002
  peer_remote_session_range = ["169.254.0.6", "169.254.1.6"]
  bgp_asn                   = 65001
  bgp_cr_session_range      = ["169.254.0.5/30", "169.254.1.5/30"]
}
```


## Providers

| Name | Version |
|------|---------|
| google | >= 3 |
| google-beta | n/a 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| advertised\_route\_priority | The priority of routes advertised to the BGP peers | `number` | `100` | no |
| bgp\_asn | ASN of the Cloud Router | `number` | n/a | yes |
| bgp\_cr\_session\_range | Source IP and range of cloud router BGP session. A valid /30 subnet like 169.254.0.5/30 | `list` | n/a | yes |
| cloud\_router\_name | n/a | `string` | n/a | yes |
| gateway\_name | The name of the VPN gateway being created | `string` | n/a | yes |
| network | The name of the network to use | `string` | n/a | yes |
| peer\_asn | ASN of the peer VPN's router | `number` | n/a | yes |
| peer\_ips | Peer Tunnel IPs | `list` | n/a | yes |
| peer\_remote\_session\_range | Remote peer IP of cloud router BGP session. A valid ip in a /30 block like 169.254.0.6 | `list` | n/a | yes |
| region | The region where the gateway and tunnels are going to be created | `string` | n/a | yes |
| resource\_prefix | Resource Prefix for the GCP Resources, allow multiple instanstiation of this module | `string` | n/a | yes |
| shared\_secrets | IKEv2 Secret of the Tunnels | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gateway\_ips | The VPN Gateway Public IP |
| gateway\_self\_link | The self-link of the Gateway |