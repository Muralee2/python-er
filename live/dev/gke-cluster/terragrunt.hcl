terraform {
  source = "../../../modules/gke-cluster"
}

include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

dependencies {
  paths = ["../network", "../firewall"]
}

inputs = {
  project_id   = local.parent_config.inputs.project_id
  name         = local.parent_config.inputs.cluster_name
  region       = local.parent_config.inputs.region
  node_count        = 1
  node_machine_type = "e2-medium"
  # ✅ Match the variable names in the module exactly
  network_name = local.parent_config.inputs.network_name
  subnet_name  = local.parent_config.inputs.subnet_name

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
      max_count    = 2
      disk_size_gb = 30
    }
  ]

  master_ipv4_cidr_block = "172.16.0.0/28"
}
