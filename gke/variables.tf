variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "gke-vpc"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-cluster"
}

variable "node_machine_type" {
  description = "Machine type for nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_min_count" {
  description = "Min nodes in the pool"
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Max nodes in the pool"
  type        = number
  default     = 3
}

# Subnet maps for your 3-tier VPC
variable "public_subnets" {
  description = "Map of public subnet CIDRs"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnet CIDRs"
  type        = map(string)
}

variable "intra_subnets" {
  description = "Map of intra subnet CIDRs"
  type        = map(string)
}
