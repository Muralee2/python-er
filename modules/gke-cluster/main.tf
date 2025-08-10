terraform {
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region
  network  = var.network_self_link
  subnetwork = var.subnet_self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = var.node_count
}
