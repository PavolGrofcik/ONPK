#   -- providers.tf --

terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }
  }
}


provider "openstack" {
  user_name   = var.openstack_username
  password    = var.openstack_password
  tenant_name = var.project_name
  auth_url    = local.uniza_os_auth_url
  region      = local.uniza_os_region
  insecure    = true  #http not secured protocol over uniza vpn
  endpoint_overrides =  local.uniza_os_endpoint_overrides
}