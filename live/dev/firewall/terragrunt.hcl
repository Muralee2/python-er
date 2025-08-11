terraform {
  source  = "../../../modules/firewall"
}

include {
  path = find_in_parent_folders("root.hcl")
}

locals {
  parent_config = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

dependencies {
  paths = ["../network"]
}


inputs = {
   project_id = local.parent_config.inputs.project_id
   network    = local.parent_config.inputs.network_name

}

