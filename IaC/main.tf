resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1_test"
  admin_state_up = "true"
}

# resource "openstack_compute_instance_v2" "basic" {
#   name            = "basic"
#   image_id        = "0fc1152a-4037-4d89-a22a-60f477e2eba0"
#   flavor_id       = "1eee6fc3-f274-4406-a054-1969ac79926f"
#   key_pair        = "pgrofcik"
#   security_groups = ["default"]

#   metadata = {
#     this = "that"
#   }

#   network {
#     name = "ext-net"
#   }
# }