terraform {
  source = "../../../modules/network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  project_id = able-armor-468408-v6
  region     = us-central1
}
