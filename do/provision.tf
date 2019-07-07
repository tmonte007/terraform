provider "digitalocean" {
  token = ${'var.TF_VAR_do_token'}
}

resource "digitalocean_kubernetes_cluster" "do_ny1_k8_1" {
  name    = "do_ny1_k8_1"
  region  = "${var.do_region}"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
