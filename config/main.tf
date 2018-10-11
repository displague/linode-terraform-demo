resource "linode_instance" "linode123" {
  count = "1"
  label = "linode_foo_${count.index+1}"
  type = "g6-nanode-1"
  root_pass = "${var.root_pass}"
  image = "linode/debian9"
  region = "${var.region}"
  authorized_keys = ["${var.authorized_key}"]
}
