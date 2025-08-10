terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git//modules/private-cluster?ref=v29.0.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id       = "able-armor-468408-v6"
  name             = "dev-gke"
  region           = "us-central1"
  zones            = ["us-central1-a", "us-central1-b", "us-central1-c"]
  network          = "dev-vpc"
  subnetwork       = "dev-subnet"
  ip_range_pods    = ""
  ip_range_services= ""
  release_channel  = "REGULAR"

  master_ipv4_cidr_block = "172.16.0.0/28"

  node_pools = [
    {
      name       = "default-pool"
      machine_type = "e2-medium"
      node_count   = 1
    }
  ]
}
