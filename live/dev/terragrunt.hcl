locals {
  project_id = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project_id
  region     = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.region
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = "samurai-og1"
    prefix   = "terraform/state"
    project  = local.project_id
    location = local.region
  }
}
