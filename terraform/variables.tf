variable "project" {
  description = "The project ID"
  type        = string
  default     = "aia-project-435110"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-c"
}

variable "service_account" {
  description = "The email of the service account"
  type        = string
  default     = "new-sa@aia-project-435110.iam.gserviceaccount.com"
}