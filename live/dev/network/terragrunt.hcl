terraform {
  source = "../../../modules/network"
}

locals {
  project_id = include.root.locals.project_id
  region     = include.root.locals.region
}
inputs = {
  project_id = local.project_id
  region     = local.region
}
