terraform {
  source = "../../../modules/network"
}

inputs = {
  project_id    = "able-armor-468408-v6"
  region        = "us-central1"
  network_name  = "dev-vpc"
  subnet_name   = "dev-subnet"
  subnet_cidr   = "10.10.0.0/16"
}
