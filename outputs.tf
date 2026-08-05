output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "availability_zones" {
  description = "Availability zones used"
  value       = module.networking.availability_zones
}

output "public_ip" {
  description = "Public IP of the web instance"
  value       = module.compute.public_ip
}

output "public_dns" {
  description = "Public DNS of the web instance"
  value       = module.compute.public_dns
}

output "instance_id" {
  description = "Instance ID of the web instance"
  value       = module.compute.instance_id
}

output "website_url" {
  description = "HTTP URL for the Nginx landing page"
  value       = module.compute.website_url
}

output "db_instance_id" {
  description = "RDS instance identifier"
  value       = module.database.db_instance_id
}

output "db_endpoint" {
  description = "Private database endpoint (reachable only from the VPC)"
  value       = module.database.db_endpoint
}

output "nat_gateway_id" {
  description = "NAT Gateway ID (billable — destroy when done)"
  value       = module.networking.nat_gateway_id
}
