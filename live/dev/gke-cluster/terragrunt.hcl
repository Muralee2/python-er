terraform {
  source = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster?ref=v29.0.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id         = local.project_id
  name               = "private-gke"
  region             = local.region
  network            = local.network_name
  subnetwork         = local.subnet_name
  ip_range_pods      = "pods"
  ip_range_services  = "services"
  enable_private_nodes = true
  enable_private_endpoint = false
  master_ipv4_cidr_block = "172.16.0.0/28"
}
