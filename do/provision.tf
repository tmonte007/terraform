provider "digitalocean" {
  token = "${var.do_token}"
}


resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web1"
  region = "nyc3"
  size   = "s-1vcpu-2gb"
  tags   = ["docker","nyc3"]
}


resource "digitalocean_firewall" "web" {
  name = "docker-fw"

  droplet_ids = ["${digitalocean_droplet.web.id}"]

  inbound_rule {
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
      protocol           = "tcp"
      port_range         = "80"
      source_addresses   = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
      protocol           = "tcp"
      port_range         = "443"
      source_addresses   = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
      protocol           = "icmp"
      source_addresses   = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol                = "tcp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol                = "udp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
      protocol                = "icmp"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
  }
}
