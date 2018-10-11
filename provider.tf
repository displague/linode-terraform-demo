provider "linode" {
  token = "${var.linode_token}"
}

module "app1" {
  source = "./config"

  authorized_key = "${var.authorized_key}"
  root_pass = "${var.root_pass}"
  region = "${var.region}"
}
