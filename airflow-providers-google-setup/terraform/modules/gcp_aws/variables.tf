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
