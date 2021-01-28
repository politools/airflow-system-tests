variable "billing_account" {
  type = string
}

variable "project_id" {
  type    = string
  default = "airflow-systest-temp"
}

variable "region" {
  type    = string
  default = "europe-west3"
}
