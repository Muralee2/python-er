terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.0"
    }
  }
}

data "external" "firewall_rules" {
  program = ["python3", "${path.module}/../../scripts/generate_firewall.py"]

  query = {
    network_name = var.network_name
    project_id   = var.project_id
  }
}

resource "google_compute_firewall" "allow_gke_master" {
  name    = data.external.firewall_rules.result["allow_gke_master_name"]
  network = var.network_self_link

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = data.external.firewall_rules.result["allow_gke_master_ranges"]
  direction     = "EGRESS"
}

resource "google_compute_firewall" "allow_internal" {
  name    = data.external.firewall_rules.result["allow_internal_name"]
  network = var.network_self_link

  allow {
    protocol = "all"
  }

  source_ranges = data.external.firewall_rules.result["allow_internal_ranges"]
  direction     = "INGRESS"
}
