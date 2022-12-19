# -- variables.tf --
variable "openstack_username" {
  description = "Username for openstack cloud"
  type = string
  sensitive = true
}

variable "openstack_password" {
  description = "Password for openstack cloud"
  type = string
  sensitive = true
}

variable "project_name" {
  description = "Project name in openstack cloud"
  type = string
  sensitive = true
}

variable "image_id"{
  description = "Image id for compute instance"
  type = string
  default = "0fc1152a-4037-4d89-a22a-60f477e2eba0"
}

variable "flavour_id"{
  description = "Flavour id for compute instance"
  type = string
  default = "38786c05-8577-4115-b374-0024ac93b857"
}

variable "key_pair" {
  description = "Key pair for communication"
  type = string
  default = "pgrofcik"
}

variable "remote_ip_prefix" {
  description = "Remote ip to connect"
  type = string
  default = "158.193.0.0/16"
}