terraform {
  source = "git::https://github.com/terraform-google-modules/terraform-google-kubernetes-engine.git//modules/private-cluster?ref=v29.0.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id         = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project_id
  name               = "dev-private-cluster"
  region             = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.region
  network            = "dev-vpc"
  subnetwork         = "dev-subnet"
  ip_range_pods      = "pods"
  ip_range_services  = "services"
  enable_private_nodes = true
  enable_private_endpoint = false
}
