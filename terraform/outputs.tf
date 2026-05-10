output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.webapp_server.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.webapp_server.public_ip
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.webapp_sg.id
}

output "web_app_url" {
  description = "The URL to access the web application"
  value       = "http://${aws_instance.webapp_server.public_ip}:8080"
}