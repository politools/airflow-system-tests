/*!
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

provider "aws" {
  region = "us-east-1"
}

locals {
  project_id = "polidea-airflow"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

resource "google_storage_bucket" "cloud_build_logs_bucket" {
  name     = "${local.project_id}-system-tests-logs-${random_string.bucket_suffix.result}"
  location = "EU"
  project  = local.project_id

  uniform_bucket_level_access = true
}

module "service_accounts_setup" {
  source      = "../../modules/service_accounts_setup"
  project     = local.project_id
  bucket_name = "${local.project_id}-system-tests-${random_string.bucket_suffix.result}"
}

module "campaign_manager_airflow" {
  source                      = "../../modules/campaign_manager_airflow"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "dataflow_viewer_test" {
  source                      = "../../modules/dataflow_viewer_test"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_ai" {
  source                      = "../../modules/gcp_ai"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_automl_account" {
  source                      = "../../modules/gcp_automl_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_bigquery_account" {
  source                      = "../../modules/gcp_bigquery_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_bigtable_account" {
  source                      = "../../modules/gcp_bigtable_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_cloud_build_account" {
  source                      = "../../modules/gcp_cloud_build_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_cloudsql_account" {
  source                      = "../../modules/gcp_cloudsql_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_compute_account" {
  source                      = "../../modules/gcp_compute_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_datastore_account" {
  source                      = "../../modules/gcp_datastore_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_dlp" {
  source                      = "../../modules/gcp_dlp"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_function_account" {
  source                      = "../../modules/gcp_function_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_gke_account" {
  source                      = "../../modules/gcp_gke_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_memorystore" {
  source                      = "../../modules/gcp_memorystore"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_pubsub_account" {
  source                      = "../../modules/gcp_pubsub_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_secret_manager_account" {
  source                      = "../../modules/gcp_secret_manager_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_spanner_account" {
  source                      = "../../modules/gcp_spanner_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_storage_account" {
  source                      = "../../modules/gcp_storage_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_storage_transfer_account" {
  source                      = "../../modules/gcp_storage_transfer_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_task_account" {
  source                      = "../../modules/gcp_task_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}

module "gcp_vision_account" {
  source                      = "../../modules/gcp_vision_account"
  service_account_bucket_name = module.service_accounts_setup.bucket_name
  project                     = local.project_id
}
