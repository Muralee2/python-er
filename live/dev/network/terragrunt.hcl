terraform {terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/vpc?ref=v7.1.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  network_name       = "dev-vpc"
  auto_create_subnetworks = false

  subnets = [
    {
      subnet_name           = "dev-subnet"
      subnet_ip             = "10.0.0.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = true
      subnet_flow_logs      = true
    }
  ]
}

  path = find_in_parent_folders()
}

inputs = {
  project_id   = local.project_id
  network_name = local.network_name
}
