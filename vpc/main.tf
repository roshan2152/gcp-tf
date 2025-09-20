terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "gke-vpc"
  region              = var.region
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  intra_subnet_cidr   = "10.0.3.0/24"
}

