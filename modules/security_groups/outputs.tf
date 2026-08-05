output "web_security_group_id" {
  description = "ID of the web-tier security group"
  value       = aws_security_group.web.id
}

output "db_security_group_id" {
  description = "ID of the database-tier security group"
  value       = aws_security_group.db.id
}

# Back-compat alias used by older root wiring
output "security_group_id" {
  description = "Alias for web_security_group_id"
  value       = aws_security_group.web.id
}
