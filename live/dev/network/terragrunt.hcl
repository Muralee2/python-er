terraform {
  source = "../../../modules/network"
}

inputs = {
  project_id    = local.project_id
  region        = local.region
  network_name  = "dev-vpc"
  subnet_name   = "dev-subnet"
  subnet_cidr   = "10.10.0.0/16"
}
