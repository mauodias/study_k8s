terraform {
  backend "gcs" {
    bucket = "kubepractices-tf-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "kubepractices"
  region  = "europe-west4-a"
}
