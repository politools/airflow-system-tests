module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name = "campaign-manager-airflow"
  project_roles = [
    "${var.project}=>roles/storage.objectCreator",
    "${var.project}=>roles/storage.objectViewer",
    "${var.project}=>roles/storagetransfer.admin",
    "${var.project}=>roles/storagetransfer.user",
  ]
}
