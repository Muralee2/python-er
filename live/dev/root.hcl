locals {
  project_id   = "able-armor-468408-v6"
  region       = "us-central1"
  network_name = "dev-vpc"
  subnet_name  = "dev-subnet"
  subnet_cidr  = "10.0.0.0/24"
}

inputs = {
  project_id   = local.project_id
  network_name = local.network_name
  subnet_name  = local.subnet_name
  subnet_cidr  = local.subnet_cidr
  region       = local.region
}

# Remote state (GCS)
remote_state {
  backend = "gcs"
  config = {
    bucket         = "samurai-og1"
    prefix         = "terraform/state"
    project        = local.project_id
    location       = "US"
    encryption_key = null
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "gcs" {}
}
EOF
}
