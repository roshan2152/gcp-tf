output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnet_self_link
}

output "private_subnet" {
  value = module.vpc.private_subnet_self_link
}

output "intra_subnet" {
  value = module.vpc.intra_subnet_self_link
}

