terraform {
  backend "gcs" {
    bucket = "polidea-airflow-system-tests-setup"
    prefix = "terraform_state/google-cloud-setup-env/terraform.tfstate"
  }
}
