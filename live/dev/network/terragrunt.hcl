terraform {
  source = "../../../modules/network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id = local.project_id
  region     = local.region
}
