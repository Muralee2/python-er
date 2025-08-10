terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git//modules/private-cluster?ref=v31.0.0"
}

include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

# Explicit dependency on the network module
dependency "network" {
  config_path = "../network"

  # Mock outputs for plan-only runs without applying network
  mock_outputs = {
    network_name = "placeholder-network"
    subnet_name  = "placeholder-subnet"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

# Optional: dependency on firewall if needed for ordering only
dependency "firewall" {
  config_path = "../firewall"
}

inputs = {
  project_id         = local.parent_config.inputs.project_id
  name               = "dev-gke"
  region             = local.parent_config.inputs.region

  # Pull values from network module outputs
  network            = dependency.network.outputs.network_name
  subnetwork         = dependency.network.outputs.subnet_name

  ip_allocation_policy = {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  ip_range_pods     = "pods"
  ip_range_services = "services"

  remove_default_node_pool = true
  node_pools = [
    {
      name         = "default-node-pool"
      machine_type = "e2-medium"
      node_count   = 1
      min_count    = 1
      max_count    = 3
      disk_size_gb = 100
    }
  ]

  master_ipv4_cidr_block = "172.16.0.0/28"
}

