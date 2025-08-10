terraform {
  source = "../../../modules/firewall"
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  project_id         = "your-gcp-project-id"
  region             = "us-central1"
  network_name       = "dev-vpc"
  network_self_link  = dependency.network.outputs.network_self_link
}

