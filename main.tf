resource "digitalocean_container_registry" "container_registry" {
  name                   = "${var.environment}-${var.project_name}-container-registry"
  subscription_tier_slug = "basic"
  region                 = var.region
}

resource "digitalocean_vpc" "cluster_vpc" {
  name   = "${var.environment}-${var.project_name}-vpc"
  region = var.region

  timeouts {
    delete = "10m"
  }
}

data "digitalocean_kubernetes_versions" "k8s_versions" {
  version_prefix = "1.22."
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name         = "${var.environment}-${var.project_name}-cluster"
  region       = var.region
  version      = data.digitalocean_kubernetes_versions.k8s_versions.latest_version
  vpc_uuid     = digitalocean_vpc.cluster_vpc.id
  auto_upgrade = true

  node_pool {
    name       = "${var.environment}-${var.project_name}-default-worker-pool"
    size       = var.default_pool_worker_type
    node_count = var.default_pool_size
  }

  maintenance_policy {
    start_time  = "04:00"
    day         = "sunday"
  }
}

resource "digitalocean_kubernetes_node_pool" "additional_pool" {
  count      = var.enable_additional_pool ? 1 : 0
  cluster_id = digitalocean_kubernetes_cluster.cluster.id
  name       = "${var.environment}-${var.project_name}-additional-pool"
  size       = var.additional_pool_worker_type
  node_count = var.additional_pool_size
}

resource "digitalocean_project" "project" {
  name        = "${var.environment}-${var.project_name}"
  resources   = [digitalocean_kubernetes_cluster.cluster.urn]
}