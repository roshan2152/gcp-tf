output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "public_subnet_self_link" {
  value = google_compute_subnetwork.public.self_link
}

output "private_subnet_self_link" {
  value = google_compute_subnetwork.private.self_link
}

output "intra_subnet_self_link" {
  value = google_compute_subnetwork.intra.self_link
}

