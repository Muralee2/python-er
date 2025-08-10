output "firewall_names" {
  value = [
    google_compute_firewall.allow_internal.name,
    google_compute_firewall.allow_ssh.name
  ]
}
