terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"    # adjust if you need newer
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC module (assumes you already have modules/vpc from earlier)
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  region   = var.region

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  intra_subnets   = var.intra_subnets
}

# GKE module
module "gke" {
  source = "./modules/gke"

  project_id = var.project_id
  name       = var.cluster_name
  region     = var.region

  # supply the private subnet self-links from vpc module
  private_subnet_self_links = values(module.vpc.private_subnets) # list of self_links
  public_subnet_self_links  = values(module.vpc.public_subnets)

  node_machine_type = var.node_machine_type
  node_min_count    = var.node_min_count
  node_max_count    = var.node_max_count
}

# Reserve a global static IP for external HTTP(S) load balancer frontend
resource "google_compute_global_address" "lb_static_ip" {
  name = "${var.cluster_name}-lb-ip"
  project = var.project_id
  description = "Static IP for HTTP(S) Load Balancer frontend"
  ip_version = "IPV4"
}
