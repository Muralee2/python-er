remote_state {
  backend = "gcs"
  config = {
    bucket         = "samurai-og1"           # Use your existing bucket here
    prefix         = "${local.env}"
    project        = "able-armor-468408-v6"
    location       = "US"
    impersonate_service_account = "terraform-deployer-sa@able-armor-468408-v6.iam.gserviceaccount.com"
  }
}
