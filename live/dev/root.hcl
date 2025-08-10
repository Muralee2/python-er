locals {
  project_id   = "able-armor-468408-v6"
  region       = "us-central1"
  network_name = "dev-vpc6"
  subnet_name  = "dev-subnet4"
  subnet_cidr  = "10.0.0.0/23"
  cluster_name = "power2"
}

inputs = {
  project_id   = local.project_id
  network_name = local.network_name
  subnet_name  = local.subnet_name
  subnet_cidr  = local.subnet_cidr
  region       = local.region
  cluster_name = local.cluster_name
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = "og-samurai"
    prefix   = "${path_relative_to_include()}"
    project  = local.project_id
    location = "US"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.project_id}"
  region  = "${local.region}"
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "gcs" {}
}
EOF
}
