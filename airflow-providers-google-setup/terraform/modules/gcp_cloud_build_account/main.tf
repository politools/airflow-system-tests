module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name = "gcp-cloud-build-account"
  project_roles = [
    "${var.project}=>roles/cloudbuild.builds.editor",
    "${var.project}=>roles/source.admin",
    "${var.project}=>roles/storage.admin",
    "${var.project}=>roles/storage.objectAdmin",
  ]
}
