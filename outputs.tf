output "registry_endpoint" {
  value       = digitalocean_container_registry.container_registry.endpoint
  description = "Endpoint of the container registry created."
}

output "kubernetes_cluster_id" {
  value       = digitalocean_kubernetes_cluster.cluster.id
  description = "Id of the cluster created."
}

output "kubernetes_default_node_pool_name" {
  value       = digitalocean_kubernetes_cluster.cluster.node_pool[0].name
  description = "Name of the default node pool of the cluster created."
}

output "kubernetes_additional_node_pool_name" {
  value       =  var.enable_additional_pool ? digitalocean_kubernetes_node_pool.additional_pool[0].name : "N/A"
  description = "Name of the additional node pool of the cluster created."
}