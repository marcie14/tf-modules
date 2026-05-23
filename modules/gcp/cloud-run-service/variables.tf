variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "image" {
  description = "Container image URI to deploy"
  type        = string
}

variable "max_instance_count" {
  description = "Maximum number of Cloud Run instances"
  type        = number
  default     = 2
}

variable "allow_public_access" {
  description = "whether to allow unauthenticated access"
  type        = bool
  default     = false
}
