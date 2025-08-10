terraform {
  source = "terraform-google-modules/network/google//modules/vpc?ref=v7.1.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id   = local.project_id
  network_name = local.network_name
}
