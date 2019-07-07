provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "DOcluster" {
  name    = "DONY1K8S"
  region  = "nyc1"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-1gb"
    node_count = 2
  }
}

output "cluster-id" {
  value = "${digitalocean_kubernetes_cluster.DOcluster.id}"
}
