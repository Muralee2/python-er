provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  cluster_location = var.location
}

# Service account for cluster (optional dedicated SA)
resource "google_service_account" "gke_sa" {
  account_id   = "${var.name}-sa"
  display_name = "GKE service account for ${var.name}"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = var.name
  location = local.cluster_location

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network_self_link
  subnetwork = var.subnet_self_link

  # optionally pin master version
  lifecycle {
    ignore_changes = [
      # ignore node pool etc managed separately
    ]
  }

  # optional master version if provided
  dynamic "master_auth" {
    for_each = var.min_master_version == null ? [] : [1]
    content {
      # master_auth used only if a specific config needed - placeholder
    }
  }

  # enable private nodes if required
  private_cluster_config {
    enable_private_nodes = var.enable_private_nodes
    # if private, additional network config may be required
  }

  # enable basic logging/monitoring (default enabled)
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

# Node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.name}-nodes"
  cluster    = google_container_cluster.primary.name
  location   = local.cluster_location
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    service_account = google_service_account.gke_sa.email

    # apply tags to the underlying instances if specified
    tags = var.node_tags

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = max(1, var.node_count * 2)
  }
}

# Optional: output the node pool instance template or instance group info is omitted for brevity

