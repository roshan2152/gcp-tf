
# 🔎 Lookup existing VPC by name
data "google_compute_network" "vpc" {
  name = var.vpc_name
}

# 🔎 Lookup private subnets in the region
data "google_compute_subnetwork" "private" {
  for_each = toset(var.private_subnet_names)

  name   = each.key
  region = var.region
}

module "gke" {
  source = "./modules/"

  project_id = var.project_id
  name       = var.cluster_name
  region     = var.region

  vpc_self_link             = data.google_compute_network.vpc.self_link
  private_subnet_self_links = [for s in data.google_compute_subnetwork.private : s.self_link]
  # private_subnet_self_links = [values(data.google_compute_subnetwork.private)[0].self_link]


  node_machine_type = var.node_machine_type
  node_min_count    = var.node_min_count
  node_max_count    = var.node_max_count
}
