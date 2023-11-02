provider "google" {
  project = var.project_id
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "sm_bucket"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
