provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "do-docker" {
  image  = "ubuntu-18-04-x64"
  name   = "do-docker1"
  region = "nyc3"
  size   = "s-1vcpu-2gb"
  tags   = ["docker","nyc3"]
}

output "ip" {
    value = "${digitalocean_droplet.do-docker1.ipv4_address}"
}
