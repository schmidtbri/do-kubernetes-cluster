variable "project_name" {
  description = "Name of the project, this name will be added to the names of all of the resources created."
  type        = string
}

variable "environment" {
  description = "Environment name that will be added to the name of all of the resources created."
  type        = string
}

variable "region" {
  description = "Region to use for the cluster."
  type        = string
  default     = "nyc3"
  validation {
    condition     = contains(["nyc3", "ams3", "sfo3", "sgp1"], var.region)
    error_message = "Allowed values for region are \"nyc3\", \"ams3\", \"sfo3\", or \"sgp1\"."
  }
}

variable "default_pool_size" {
  description = "Number of nodes to create in default node pool."
  type        = number
  default     = 2
}

variable "default_pool_worker_type" {
  description = "Type of the droplets to use for the default node pool."
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "enable_additional_pool" {
  description = "Enable or disable creation of additional node pool."
  type        = bool
  default     = false
}

variable "additional_pool_size" {
  description = "Number of nodes to create in the additional node pool."
  type        = number
  default     = 1
}

variable "additional_pool_worker_type" {
  description = "Type of the droplets to use for the additional node pool."
  type        = string
  default     = "s-1vcpu-2gb"
}
