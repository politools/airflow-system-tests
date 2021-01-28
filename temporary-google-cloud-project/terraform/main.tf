provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_string" "project_suffix" {
  length  = 8
  special = false
  upper   = false
  number  = false
}


resource "google_project" "my_project" {
  name            = "${var.project_id}-${random_string.project_suffix.result}"
  project_id      = "${var.project_id}-${random_string.project_suffix.result}"
  billing_account = var.billing_account
}
