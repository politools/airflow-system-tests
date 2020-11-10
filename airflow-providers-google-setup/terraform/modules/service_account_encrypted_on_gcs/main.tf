variable "name" {
  type        = string
  description = "The name of the service account."
}

module "service_account" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 2.0"

  project_id = var.project_id

  names         = [var.name]
  generate_keys = true
  project_roles = var.project_roles
}

resource "google_storage_bucket_object" "service_account_key" {
  name    = "service-accounts/${var.name}.json"
  content = module.service_account.key
  bucket  = var.bucket_name
}
