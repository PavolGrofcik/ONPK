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
  auth_url    = "http://158.193.153.3:5000/v3/"
  # region      = "RegionOne"
  # domain_name = "Default"
  insecure    = true
  # endpoint_overrides =  {
  #   "cloudformation" = "http://158.193.153.3:8000/v1"
  #   "network" = "http://158.193.153.3:9696"
  #   "compute" = "http://158.193.153.3:8774/v2.1/5bd4b820205249669e418fa7c1f7df40"
  # }
}