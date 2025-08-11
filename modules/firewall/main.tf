resource "google_compute_firewall" "gke_firewall" {
  for_each = { for rule in var.firewall_rules : rule.name => rule }

  name    = each.value.name
  network = var.network_name

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  direction     = each.value.direction
  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
}
