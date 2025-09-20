output "cluster_name" {
  value = module.gke.name
}

output "cluster_endpoint" {
  value = module.gke.endpoint
}

output "cluster_ca_cert" {
  value = module.gke.ca_certificate
}

output "node_pool_name" {
  value = module.gke.node_pool_name
}
