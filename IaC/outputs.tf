# -- output.tf --


#Instance compute name
output "instance_name" {
  value = openstack_compute_instance_v2.v_instance_server.name
}

#Instance compute assigned ip address to connect via SSH
output "instance_compute_ip" {
  value = openstack_compute_instance_v2.v_instance_server.access_ip_v4
}
