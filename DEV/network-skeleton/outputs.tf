output "test_vpc_id" {
  value = module.network_skeleton.vpc_id
}

output "private_subnet_id" {
  value = module.network_skeleton.private_subnet_id
}

output "public_subnet_id" {
  value = module.network_skeleton.public_subnet_id
}
