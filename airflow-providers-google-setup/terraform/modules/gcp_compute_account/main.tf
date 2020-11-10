module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name = "gcp-compute-account"
  project_roles = [
    "${var.project}=>roles/compute.instanceAdmin",
    "${var.project}=>roles/compute.instanceAdmin.v1",
    "${var.project}=>roles/iam.serviceAccountUser",
  ]
}
