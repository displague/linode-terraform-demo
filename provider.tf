var "linode_token" { }
var "root_pass" { default = "BADIDEaM4t3" }
var "authorized_key" { optional = true }

provider "linode" {
  token = "${vars.linode_token}"
}

module "app1" {
  source = "./config"
}
