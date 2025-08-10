locals {
  project_id = "able-armor-468408-v6"
  region     = "us-central1"
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = "samurai-og1"
    prefix   = "terraform/state/dev"
    project  = local.project_id
    location = local.region
  }
}

inputs = {
  project_id = local.project_id
  region     = local.region
}


