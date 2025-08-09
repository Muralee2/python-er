terraform {
  required_version = ">= 1.3.0"
}

provider "google" {
  project = var.project_id
}

provider "external" {}
