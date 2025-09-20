resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Public subnet
resource "google_compute_subnetwork" "public" {
  name          = "${var.vpc_name}-public"
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

# Private subnet
resource "google_compute_subnetwork" "private" {
  name          = "${var.vpc_name}-private"
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
  private_ip_google_access = true # allow private access to Google APIs
}

# Intra subnet
resource "google_compute_subnetwork" "intra" {
  name          = "${var.vpc_name}-intra"
  ip_cidr_range = var.intra_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

