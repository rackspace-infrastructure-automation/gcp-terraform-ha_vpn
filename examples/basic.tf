provider "google" {
  project = "FOO"
  region  = "europe-west6"
  version = "3.11"
}


module "ha_vpn" {
  source = "git@github.com:rackspace-infrastructure-automation/gcp-terraform-ha_vpn/?ref=master"

  network                   = "default"
  region                    = "europe-west6"
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

