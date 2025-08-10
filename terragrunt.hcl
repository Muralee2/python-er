terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    required_var_files = []
  }
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = "samurai-og1"
    prefix   = "terraform/state"
    project  = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project_id
    location = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.region
  }
}
