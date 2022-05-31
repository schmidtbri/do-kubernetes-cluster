terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

module "kubernetes_cluster" {
  source = "../../"

  project_name             = "model_services"
  environment              = "dev"
  region                   = "sfo3"
  default_pool_size        = 3
  default_pool_worker_type = "s-1vcpu-1gb"
}