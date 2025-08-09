output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "node_pool_name" {
  value = google_container_node_pool.primary_nodes.name
}

output "node_service_account" {
  value = google_service_account.gke_sa.email
}
