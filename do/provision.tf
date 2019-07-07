provider "digitalocean" {
  token = "${var.TF_VAR_do_token}"
}

resource "digitalocean_kubernetes_cluster" "${var.do_cluster}" {
  name    = "${var.do_cluster}"
  region  = "${var.do_region}"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
