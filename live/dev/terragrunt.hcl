remote_state {
  backend = "gcs"
  config = {
    bucket = "samurai-og1"   # Replace with your bucket name
    prefix = "terraform/state/dev"    # State folder inside bucket
  }
}
