output "firewall_rule_names" {
  description = "Names of the created firewall rules."
  value       = [for rule in google_compute_firewall.gke_firewall : rule.name]
}
