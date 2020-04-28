provider "google" {
  project = var.project_id
  region  = var.region
  version = "3.11"
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  version = "3.11"
}

terraform {
  required_version = "0.12.24"

  backend "gcs" {
    bucket = "mgcp-testing-tf-state"
    prefix = "ha_vpn"
  }
}