# 🔎 Lookup existing VPC
data "google_compute_network" "vpc" {
  name = var.vpc_name
}

# 🔎 Lookup first private subnet
data "google_compute_subnetwork" "private" {
  name   = var.private_subnet_name
  region = var.region
}

module "gke" {
  source = "./modules"

  project_id = var.project_id
  name       = var.cluster_name
  region     = var.region
  zone      = var.zone

  vpc_self_link              = data.google_compute_network.vpc.self_link
  private_subnet_self_links  = data.google_compute_subnetwork.private.self_link

  node_machine_type = var.node_machine_type
  node_min_count    = var.node_min_count
  node_max_count    = var.node_max_count
}
