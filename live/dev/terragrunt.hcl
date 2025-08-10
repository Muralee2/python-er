remote_state {
  backend = "gcs"
  config = {
    bucket = "samurai-og1"     # Replace with your GCS bucket
    prefix = "terraform/state/dev"
  }
}

locals {
  project_id = "able-armor-468408-v6"
  region     = "us-central1"
}
