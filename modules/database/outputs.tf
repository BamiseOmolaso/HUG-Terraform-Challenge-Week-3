output "db_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.main.id
}

output "db_endpoint" {
  description = "Connection endpoint (host:port) of the database"
  value       = aws_db_instance.main.endpoint
}

output "db_address" {
  description = "Hostname of the database instance"
  value       = aws_db_instance.main.address
}

output "db_port" {
  description = "Port of the database instance"
  value       = aws_db_instance.main.port
}

output "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = aws_db_subnet_group.main.name
}
