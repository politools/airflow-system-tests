module "project-service" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "4.0.0"

  project_id = var.project

  activate_apis = [
    "cloudkms.googleapis.com",
  ]
}

resource "google_storage_bucket" "service-account-bucket" {
  depends_on = [module.kms]

  name     = var.bucket_name
  location = "EU"
  project  = var.project

  uniform_bucket_level_access = true

  encryption {
    default_kms_key_name = module.kms.keys["service-accounts"]
  }

}

data "google_storage_project_service_account" "gcs_account" {
  project = var.project
}

resource "random_string" "keyring_suffix" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

module "kms" {
  depends_on = [module.project-service]
  source     = "terraform-google-modules/kms/google"
  version    = "~> 1.2"

  project_id = var.project
  location   = "europe"
  keyring    = "airflow-system-tests-${random_string.keyring_suffix.result}"
  keys       = ["service-accounts"]

  encrypters = [
    # serviceAccount:service-<PROJECT_NUMBER>@gs-project-accounts.iam.gserviceaccount.com"
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
  ]
  decrypters = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
  ]

  set_encrypters_for = [
    "service-accounts"
  ]

  set_decrypters_for = [
    "service-accounts"
  ]
}
