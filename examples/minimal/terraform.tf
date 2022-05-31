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

  project_name = "model_services"
  environment  = "dev"
}