# terragrunt.hcl (root)
terraform {
  backend "gcs" {
    bucket = "samurai-og1" # Create this bucket in GCS first
    prefix = "gke-infra/state"              # Path inside the bucket
  }
}

locals {
  project_id      = "able-armor-468408-v6"
  region          = "us-central1"
  network_name    = "custom-vpc"
  subnet_name     = "custom-subnet"
  subnet_cidr     = "10.0.0.0/24"
}

# Apply these inputs to all child modules
inputs = {
  project_id   = local.project_id
  region       = local.region
  network_name = local.network_name
  subnet_name  = local.subnet_name
  subnet_cidr  = local.subnet_cidr
}

# Make all child terragrunt.hcl files inherit from here
remote_state {
  backend = "gcs"
  config = {
    bucket = "your-terraform-state-bucket"
    prefix = "gke-infra/state"
  }
}

