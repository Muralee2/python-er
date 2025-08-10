terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/vpc?ref=v7.1.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id   = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project_id
  network_name = "dev-vpc"
  routing_mode = "REGIONAL"
}
