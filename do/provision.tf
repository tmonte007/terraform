# Digital Ocean token
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

# Create Kubernetes cluster
resource "digitalocean_kubernetes_cluster" "do_ny1_k8_1" {
  name    = "do_ny1_k8_1"
  region  = "nyc1"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
