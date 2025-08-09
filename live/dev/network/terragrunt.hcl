terraform {
  source = "../../../modules/network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id   = "my-gcp-project"
  name         = "dev-network"
  region       = "us-central1"
  subnet_cidr  = "10.10.0.0/24"
}
