locals {
  env_config = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = merge(
  local.env_config.inputs,
  {
    environment = "dev"
  }
)
