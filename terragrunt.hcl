terraform {
  source = "terraform-google-modules/network/google//modules/vpc?ref=v7.1.0"

  backend "gcs" {
    bucket  = "samurai-og1" # GCS bucket name
    prefix  = "network/state"               # Folder path inside the bucket
  }
}

locals {
  project_id      = "your-gcp-project-id"
  region          = "us-central1"
  network_name    = "custom-vpc"
  subnet_name     = "custom-subnet"
  subnet_cidr     = "10.0.0.0/24"
}

inputs = {
  project_id   = local.project_id
  region       = local.region
  network_name = local.network_name
  subnet_name  = local.subnet_name
  subnet_cidr  = local.subnet_cidr
}
