module "vpn1" {
  source = "../"

  network                   = "default"
  region                    = "europe-west6"
  cloud_router_name         = "vpn-a"
  gateway_name              = "test-gw-a"
  resource_prefix           = "test-a"
  shared_secrets            = ["foobar", "foobar"]
  peer_ips                  = ["1.1.1.1","2.2.2.2"]
  peer_asn                  = 65002
  peer_remote_session_range = ["169.254.0.6", "169.254.1.6"]
  bgp_asn                   = 65001
  bgp_cr_session_range      = ["169.254.0.5/30", "169.254.1.5/30"]
}
