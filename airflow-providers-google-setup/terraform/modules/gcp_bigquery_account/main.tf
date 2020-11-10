module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name = "gcp-bigquery-account"
  project_roles = [
    "${var.project}=>roles/bigquery.admin",
    "${var.project}=>roles/bigquerydatatransfer.serviceAgent",
    "${var.project}=>roles/storage.objectAdmin",
  ]
}
