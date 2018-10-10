resource "linode_instance" "linode123" {
  label = "linode_foo"
  type = "g6-nanode-1"
  root_pass = "BADIDEaM4t3"
  image = "linode/debian"
  authorized_keys = ["${chomp(file("~/.ssh/id_rsa.pub"))}"]
}
