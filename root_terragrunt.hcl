locals {
  project_id   = "able-armor-468408-v6"
  region       = "us-central1"
  network_name = "dev-vpc"
  subnet_name  = "dev-subnet"
  subnet_cidr  = "10.0.0.0/24"
}

# Remote state (GCS)
remote_state {
  backend = "gcs"
  config = {
    bucket         = "samurai-og1"
    prefix         = "dev/${path_relative_to_include()}"
    project        = local.project_id
    location       = "US"
    encryption_key = null
  }
}

# Provider
terraform {
  extra_arguments "provider_config" {
    commands = get_terraform_commands_that_need_vars()
    optional_var_files = []
  }
}

