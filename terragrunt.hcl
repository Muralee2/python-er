locals {
  project_id      = "able-armor-468408-v6"
  region          = "us-central1"
  network_name    = "custom-vpc"
  subnet_name     = "custom-subnet"
  subnet_cidr     = "10.0.0.0/24"
}

remote_state {
  backend = "gcs"
  config = {
    bucket         = "my-terraform-state-bucket"
    prefix         = "${path_relative_to_include()}"
    project        = local.project_id
    location       = "us"
  }
}

inputs = {
  project_id   = local.project_id
  region       = local.region
  network_name = local.network_name
  subnet_name  = local.subnet_name
  subnet_cidr  = local.subnet_cidr
}

