variable "vpc" {
  type        = string
  description = "Id da VPC"
}

variable "sg-cidr" {
  description = "Mapa de portas de serviços"
}

variable "sg-self" {
  description = "Mapa de portas de serviços"
}

variable "tag-sg" {
  description = "Mapa de portas para o mesmo security group"
}
