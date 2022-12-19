output "instance_name" {
  value = openstack_compute_instance_v2.v_instance_server.name
}

output "sec_group_ssh_ip_address" {
  value = openstack_networking_secgroup_rule_v2.secgroup_rule_ssh.remote_ip_prefix
}