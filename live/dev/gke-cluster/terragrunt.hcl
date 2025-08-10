terraform {
  source = "../../../modules/gke-cluster"
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  project_id        = "your-gcp-project-id"
  region            = "us-central1"
  cluster_name      = "dev-cluster"
  network_self_link = dependency.network.outputs.network_self_link
  subnet_self_link  = dependency.network.outputs.subnet_self_link
  node_machine_type = "e2-medium"
  node_count        = 2
}
