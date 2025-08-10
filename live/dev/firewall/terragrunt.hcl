terraform {
  source = "../../../modules/firewall"
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  project_id         = "local.project_id"
  region             = "local.region"
  network_name       = "dev-vpc"
  network_self_link  = dependency.network.outputs.network_self_link
}

