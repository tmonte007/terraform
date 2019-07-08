provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web1"
  region = "nyc3"
  size   = "s-1vcpu-2gb"
  tags   = "web"
}

output "ip" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}
