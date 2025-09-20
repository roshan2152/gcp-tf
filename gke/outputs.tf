output "cluster_endpoint" {
  value = module.gke.endpoint
}

output "cluster_ca_cert" {
  value = module.gke.ca_certificate
}
