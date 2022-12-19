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
  remote_ip_prefix  = var.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1.id}"
}


#ICMP ping security rule for communication with compute instance
resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_ping" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = var.remote_ip_prefix
  security_group_id = "${openstack_networking_secgroup_v2.secgroup_1.id}"
}

data "template_file" "script" {
  template = "${file("${path.module}/scripts/base.sh")}"
}

data "template_file" "script2" {
    template = "${file("${path.module}/scripts/docker.sh")}"
}

data "template_file" "script3" {
    template = "${file("${path.module}/scripts/minikube.sh")}"
}

data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.script2.rendered}"
  }

    part {
    filename     = "init2.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.script3.rendered}"
  }
}

resource "openstack_compute_instance_v2" "v_instance_server" {
  name = "compute_instance"
  image_id = var.image_id
  flavor_id = var.flavour_id
  key_pair = var.key_pair
  security_groups = ["${openstack_networking_secgroup_v2.secgroup_1.id}"]
  user_data     = data.cloudinit_config.user_data.rendered

  network {
    name = "ext-net"
  }
}
