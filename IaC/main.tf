# -- main.tf --
# resource "openstack_networking_network_v2" "network_1" {
#   name           = "network_1_test"
#   admin_state_up = "true"
# }

#Security group within virtual instance
resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name        = "sec_group_compute"
  description = "Security group fro compute instance"
}

#SSH security rule for communication with compute instance
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "158.193.0.0/16"#var.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1.id}"
}


#ICMP ping security rule for communication with compute instance
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_ping" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "158.193.0.0/16"#var.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1.id}"
}

resource "openstack_compute_instance_v2" "v_instance_server" {
  name = "compute_instance"
  image_id = var.image_id
  flavor_id = var.flavour_id
  key_pair = var.key_pair
  security_groups = ["${openstack_networking_secgroup_v2.secgroup_1.id}"]

  network {
    name = "ext-net"
  }
}
