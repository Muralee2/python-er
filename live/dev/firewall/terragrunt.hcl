include "root" {
  path = "${find_in_parent_folders("root.hcl")}"
}

terraform {
  source = "../../modules/firewall"
}

inputs = {
  subnet = "my-subnet-name"
  tags   = ["gke-cluster", local.cluster_name]
}

