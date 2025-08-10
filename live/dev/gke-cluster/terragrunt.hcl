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
  paths = ["../../../modules/network", "../../../modules/firewall"]
}

inputs = {
  project_id         = local.parent_config.inputs.project_id
  name               = local.parent_config.inputs.cluster_name
  region             = local.parent_config.inputs.region
  network            = local.parent_config.inputs.network_name
  subnetwork         = local.parent_config.inputs.subnet_name

  ip_allocation_policy = {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  # These are REQUIRED by the module
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
