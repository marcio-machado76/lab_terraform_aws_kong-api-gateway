output "ec2-public_ip" {
  description = "Public IP Ec2"
  value       = module.ec2-instance.ec2-public_ip
}

output "ec2_id" {
  description = "Id das instancias ec2"
  value       = module.ec2-instance.ec2_id
}

output "vpc" {
  description = "Idendificador da VPC"
  value       = module.network.vpc
}

output "public_subnet" {
  description = "Subnet public "
  value       = module.network.public_subnet
}

output "private_subnet" {
  description = "Subnet private "
  value       = module.network.private_subnet
}

output "sg-kong" {
  description = "Security group id"
  value       = module.security-group.sg-kong
}