include "root" {
  path = "${find_in_parent_folders("root.hcl")}"
}

terraform {
  source = "../../modules/firewall"
}

inputs = {
   project_id = local.parent_config.inputs.project_id
   network    = local.parent_config.inputs.network_name

}

