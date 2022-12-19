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