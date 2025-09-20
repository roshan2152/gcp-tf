variable "project_id" {
  description = "The GCP project ID where resources will be created"
  type        = string
  default     = "app-1-472704"
}

# variable "project_number" {
#   description = "The numeric project ID (used for default service account references)"
#   type        = string
# }

variable "region" {
  description = "The GCP region where resources will be created"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "The GCP zone for the GKE cluster (must belong to the selected region)"
  type        = string
  default     = "asia-south1-a"
}

variable "vpc_name" {
  description = "Name of the existing VPC"
  type        = string
  default     = "gke-vpc"
}

variable "private_subnet_name" {
  description = "Name of the existing private subnet in the region"
  type        = string
  default     = "gke-vpc-private-0"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-zonal-cluster"
}

variable "node_machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-small"   # ✅ safer default than e2-medium to stay within quota
}

variable "node_min_count" {
  description = "Minimum number of nodes per node pool"
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Maximum number of nodes per node pool"
  type        = number
  default     = 2
}
