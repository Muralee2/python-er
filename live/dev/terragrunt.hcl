remote_state {
  backend = "gcs"
  config = {
    bucket = "your-gcs-bucket-name"   # Replace with your bucket name
    prefix = "terraform/state/dev"    # State folder inside bucket
  }
}
