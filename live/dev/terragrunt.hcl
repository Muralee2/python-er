locals {
  env = "dev"
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = "samurai-og2"
    prefix   = local.env
    project  = "able-armor-468408-v6"
    location = "US"
  }
}
