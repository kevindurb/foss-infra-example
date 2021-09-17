terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

resource "linode_instance" "ci_cd" {
  label = "ci_cd"
  image = "linode/ubuntu20.04"
  region = "us-west"
  type = "g6-nanode-1"
}
