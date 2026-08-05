output "public_ip" {
  description = "Public IP of the web instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS of the web instance"
  value       = aws_instance.web.public_dns
}

output "instance_id" {
  description = "Instance ID of the web instance"
  value       = aws_instance.web.id
}

output "website_url" {
  description = "HTTP URL for the Nginx landing page"
  value       = "http://${aws_instance.web.public_ip}"
}
