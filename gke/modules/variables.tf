variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "name" {
  description = "Cluster name"
  type        = string
}

variable "region" {
  description = "Region where the cluster will be created"
  type        = string
}

variable "vpc_self_link" {
  description = "VPC self link"
  type        = string
}

variable "private_subnet_self_links" {
  description = "List of private subnet self_links"
  type        = list(string)
}

variable "node_machine_type" {
  description = "Machine type for nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_min_count" {
  description = "Minimum number of nodes in the pool"
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Maximum number of nodes in the pool"
  type        = number
  default     = 3
}
