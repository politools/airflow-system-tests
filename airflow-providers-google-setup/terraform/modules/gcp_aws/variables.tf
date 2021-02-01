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

variable "project" {
  description = "The Project ID where the service account will be created."
  type        = string
}

variable "service_account_bucket_name" {
  description = "The name of bucket where the service account will be saved."
  type        = string
}

variable "google_openid_audience" {
  description = "Constant value that is configured in the Airflow role and connection. It prevents misuse of the Google ID token."
  default     = "aws-federation.airflow.apache.org"
  type        = string
}

variable "aws_role_name" {
  description = "The name of the new AWS role."
  default     = "WebIdentity-Role-Airflow-System-Tests"
  type        = string

}

variable "aws_policy_name" {
  description = "The name of the new AWS policy"
  default     = "WebIdentity-Policy-Airflow-System-Tests"
  type        = string
}
