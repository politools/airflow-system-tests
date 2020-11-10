variable "project_id" {
  description = "Project id where the service account will be created."
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket where the service account will be uploaded."
  type        = string
}

variable "project_roles" {
  type        = list(string)
  description = "Roles to apply to service account, project=>role as elements."
  default     = []
}
