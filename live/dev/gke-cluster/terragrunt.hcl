terraform {
  source = "../../../modules/gke-cluster"
}

locals {
  project_id = include.root.locals.project_id
  region     = include.root.locals.region
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  project_id        = "local.project_id"
  region            = "local.region"
  cluster_name      = "dev-cluster"
  network_self_link = dependency.network.outputs.network_self_link
  subnet_self_link  = dependency.network.outputs.subnet_self_link
  node_machine_type = "e2-medium"
  node_count        = 2
}
