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
  name    = "service-accounts/${replace(var.name, "-", "_")}.json"
  content = module.service_account.key
  bucket  = var.bucket_name
}
