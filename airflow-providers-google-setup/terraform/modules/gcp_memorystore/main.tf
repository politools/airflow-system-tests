module "service_account" {
  source = "../service_account_encrypted_on_gcs"

  project_id  = var.project
  bucket_name = var.service_account_bucket_name

  name = "gcp-memorystore"
  project_roles = [
    "${var.project}=>roles/memcache.admin",
    "${var.project}=>roles/redis.admin",
    "${var.project}=>roles/storage.admin",
    "${var.project}=>roles/storage.hmacKeyAdmin",
  ]
}
