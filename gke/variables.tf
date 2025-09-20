variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "app-1-472704"
}

variable "region" {
  description = "Region for resources"
  type        = string
  default     = "asia-south1"
}

variable "vpc_name" {
  description = "Existing VPC name"
  type        = string
  default     = "gke-vpc"
}

variable "private_subnet_names" {
  description = "List of existing private subnet names in the region"
  type        = list(string)
  default     = ["gke-vpc-private-0", "gke-vpc-private-1", "gke-vpc-private-2"]
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "gke-cluster"
}

variable "node_machine_type" {
  description = "Node machine type"
  type        = string
  default     = "e2-micro"
}

variable "node_min_count" {
  type    = number
  default = 1
}

variable "node_max_count" {
  type    = number
  default = 1
}
