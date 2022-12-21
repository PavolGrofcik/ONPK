# -- locals.tf --

locals {
  uniza_os_region   = "RegionOne"
  uniza_os_auth_url = "http://158.193.138.33:5000/v3/"
  uniza_os_endpoint_overrides = {
    network = "http://158.193.138.33:9696/v2.0/"
    compute = "http://158.193.138.33:8774/v2.1/5bd4b820205249669e418fa7c1f7df40/"
  }
}