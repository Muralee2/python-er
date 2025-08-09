terraform {
  source = "../../../modules/firewall"
}

dependency "network" {
  config_path = "../network"
}

include {
  path = find_in_parent_folders()
}

# Ensure firewall waits for network creation
dependency "network" {
  config_path = "../network"
}

inputs = {
  project_id = "able-armor-468408-v6"
  name       = "dev-firewall"
  network    = dependency.network.outputs.network_self_link
  # The tags here must match node_tags in GKE module if applied to nodes
  target_tags = ["gke-node"]
}
