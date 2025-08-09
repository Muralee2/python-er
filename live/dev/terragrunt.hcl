# Root Terragrunt config for the dev environment
terraform {
  # Optional: remote backend could be configured here or in parent
}

locals {
  env = "dev"
}

# Configure remote state bucket & prefix
remote_state {
  backend = "gcs"
  config = {
    bucket         = "samurai-og1"
    prefix         = "${local.env}"
    project        = "my-gcp-project"
    location       = "US"
    impersonate_service_account = "terraform-deployer-sa@able-armor-468408-v6.iam.gserviceaccount.com"
  }
}
