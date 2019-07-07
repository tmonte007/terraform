provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "DOcluster" {
  name    = "do-nyc3-pool"
  region  = "nyc3"
  version = "1.14.3-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}

output "cluster-id" {
  value = "${digitalocean_kubernetes_cluster.DOcluster.id}"
}
