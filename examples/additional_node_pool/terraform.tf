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

  project_name = "model-services"
  environment  = "dev"
  region = "nyc3"
  default_pool_size = 2
  default_pool_worker_type = "s-1vcpu-2gb"
  enable_additional_pool = true
  additional_pool_size = 2
  additional_pool_worker_type = "s-1vcpu-2gb"
}