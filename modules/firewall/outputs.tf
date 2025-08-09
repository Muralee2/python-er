output "allow_gke_master_rule" {
  value = google_compute_firewall.allow_gke_master.name
}

output "allow_internal_rule" {
  value = google_compute_firewall.allow_internal.name
}
