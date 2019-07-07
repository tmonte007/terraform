provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "do_cluster_monte" {
  name    = "${var.do_cluster}"
  region  = "${var.do_region}"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
