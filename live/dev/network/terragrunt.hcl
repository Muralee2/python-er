terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/vpc?ref=v7.1.0"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

inputs = {
  project_id              = local.parent_config.inputs.project_id
  network_name            = local.parent_config.network_name
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name           = local.parent_config.subnet_name
      subnet_ip             = local.parent_config.subnet_cidr
      subnet_region         = local.parent_config.region
      subnet_private_access = true
      subnet_flow_logs      = true
    }
  ]
}

