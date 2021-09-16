output "ec2-public_ip" {
  description = "Public IP Ec2"
  value       = aws_instance.ec2[*].public_ip
}

output "ec2_id" {
  description = "Id das instancias ec2"
  value       = aws_instance.ec2[*].id
}
