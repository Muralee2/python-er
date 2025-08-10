terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git//modules/private-cluster?ref=v31.0.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../network", "../firewall"]
}

inputs = {
  project_id         = include.inputs.project_id
  name               = "dev-gke"
  region             = include.inputs.region
  network            = include.inputs.network_name
  subnetwork         = include.inputs.subnet_name

  ip_allocation_policy = {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

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
