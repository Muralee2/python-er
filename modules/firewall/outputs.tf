output "allow_gke_master_rule" {
  value = google_compute_firewall.allow_gke_master.name
}

output "allow_internal_rule" {
  value = google_compute_firewall.allow_internal.name
}

output "network_self_link" {
  value = google_compute_network.my_network.self_link
}
