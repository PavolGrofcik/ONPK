# -- locals.tf --
locals {
  kis_os_region   = "RegionOne"
  kis_os_auth_url = "http://158.193.153.3:5000/v3/"
  kis_os_endpoint_overrides = {
    network = "http://158.193.153.3:9696/"
    compute = "http://158.193.153.3:8774/v2.1/5bd4b820205249669e418fa7c1f7df40/"
  }
}