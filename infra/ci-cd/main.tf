terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

resource "linode_sshkey" "terraform_runner" {
  label = "terraform_runner"
  ssh_key = chomp(file("~/.ssh/id_ed25519.pub"))
}

resource "linode_instance" "ci_cd" {
  label = "ci_cd"
  image = "linode/ubuntu20.04"
  region = "us-west"
  type = "g6-nanode-1"
  authorized_keys = [linode_sshkey.terraform_runner.ssh_key]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -u root -i '${linode_instance.ci_cd.ip_address},' ${path.module}/provision.yaml"
  }
}
