resource "google_container_cluster" "primary" {
  name     = var.name
  location = var.zone
  project  = var.project_id

  # VPC + Subnet
  network    = var.vpc_self_link
  subnetwork = var.private_subnet_self_links

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  deletion_protection = false
}

resource "google_container_node_pool" "default" {
  name     = "${var.name}-pool"
  cluster  = google_container_cluster.primary.name
  project  = var.project_id
  location = var.zone

  node_count = var.node_min_count

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 10
    disk_type    = "pd-standard"

    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["gke-nodes"]
  }

  autoscaling {
    min_node_count = var.node_min_count
    max_node_count = var.node_max_count
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
