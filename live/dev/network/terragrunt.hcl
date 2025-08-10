terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/vpc?ref=v7.1.0"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
}

inputs = {
  project_id              = include.inputs.project_id
  network_name            = include.inputs.network_name
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name           = include.subnet_name
      subnet_ip             = include.subnet_cidr
      subnet_region         = include.region
      subnet_private_access = true
      subnet_flow_logs      = true
    }
  ]
}

