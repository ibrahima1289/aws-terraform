output "ec2-server-id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2-server.id
}

output "ec2_server_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2-server.public_ip
}
