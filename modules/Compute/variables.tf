variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "The GCP region"
}

variable "zone" {
  type        = string
  description = "The GCP zone"
}

variable "instance_name" {
  type        = string
  description = "The name of the compute instance"
}

variable "machine_type" {
  type        = string
  description = "The type of machine to create"
  default     = "e2-medium"
}

variable "disk_image" {
  type        = string
  description = "The image to use for the boot disk"
  default     = "debian-cloud/debian-11"
}

variable "network" {
  type        = string
  description = "The VPC network to attach the instance to"
  default     = "default"
}

variable "tags" {
  type        = list(string)
  description = "A list of tags to attach to the instance"
  default     = []
}

variable "startup_script" {
  description = "Startup script to initialize the instance"
  type        = string
  default     = "" # Default to an empty string if no script is provided
}