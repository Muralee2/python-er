terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/vpc?ref=v7.1.0"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

inputs = {
  project_id              = local.project_id
  network_name            = local.network_name
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name           = local.subnet_name
      subnet_ip             = local.subnet_cidr
      subnet_region         = local.region
      subnet_private_access = true
      subnet_flow_logs      = true
    }
  ]
}

