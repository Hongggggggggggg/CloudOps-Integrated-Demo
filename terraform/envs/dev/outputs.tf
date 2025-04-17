output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "nat_public_ip" {
  value = module.nat_instance.nat_public_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "web_public_ips" {
  value       = [for inst in module.web_ec2 : inst.public_ip]
}
