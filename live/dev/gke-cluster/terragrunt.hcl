terraform {
  source = "../../../modules/gke-cluster"
}

include {
  path = find_in_parent_folders()
}

# Wait for both network and firewall
dependency "network" {
  config_path = "../network"
}

dependency "firewall" {
  config_path = "../firewall"
}

inputs = {
  project_id         = "able-armor-468408-v6"
  name               = "dev-gke"
  region             = "us-central1"
  location           = "us-central1-a"
  network_self_link  = dependency.network.outputs.network_self_link
  subnet_self_link   = dependency.network.outputs.subnet_self_link
  node_count         = 3
  machine_type       = "e2-medium"
  node_tags          = ["gke-node"]  # Must match firewall target_tags
}
