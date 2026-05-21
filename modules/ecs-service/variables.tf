variable "name" {
  description = "a name prefix for resources"
  type        = string
}

variable "environment" {
  description = "dev, staging, prod"
  type        = string
}

variable "container_image" {
  description = "the Docker image URI to run"
  type        = string
}

variable "container_port" {
  description = "the port the container listens on"
  type        = number
}

variable "vpc_id" {
  description = "the vpc to deploy into"
  type        = string
}

variable "public_subnet_ids" {
  description = "where the load balancer will sit"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "where the ECS tasks will run"
  type        = list(string)
}

variable "desired_count" {
  description = "how many container instances to run"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU units per container (256 = 0.25 vCPU)"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory per container in MB"
  type        = number
  default     = 512
}

variable "min_capacity" {
  description = "Minimum number of running tasks for autoscaling"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of running tasks for autoscaling"
  type        = number
  default     = 4
}

variable "health_check_path" {
  description = "Path the load balancer hits to check if the container is healthy"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
