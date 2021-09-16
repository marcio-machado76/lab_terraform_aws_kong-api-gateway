variable "region" {
  type        = string
  description = "Região na AWS"
  default     = "us-east-1"
}

#
# vpc
#
variable "cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "count_available" {
  type        = number
  description = "Numero de Zonas de disponibilidade"
  default     = 2
}

variable "tag_vpc" {
  description = "Tag Name da VPC"
  type        = string
  default     = "VPC_Xcalota"
}

variable "tag_igw" {
  description = "Tag Name do internet gateway"
  type        = string
  default     = "igw_Xcalota"
}

variable "tag_rtable" {
  description = "Tag Name das route tables"
  type        = string
  default     = "rt-xcalota"
}

variable "nacl" {
  description = "Regras de Network Acls AWS"
  type        = map(object({ protocol = string, action = string, cidr_blocks = string, from_port = number, to_port = number }))
  default = {
    100 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 22, to_port = 22 }
    105 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 80, to_port = 80 }
    110 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 443, to_port = 443 }
    150 = { protocol = "tcp", action = "allow", cidr_blocks = "0.0.0.0/0", from_port = 1024, to_port = 65535 }
  }
}

#
# security group
#
variable "sg-cidr" {
  description = "Mapa de portas de serviços"
  type        = map(object({ to_port = number, description = string, protocol = string, cidr_blocks = list(string) }))
  default = {
    22   = { to_port = 22, description = "Entrada ssh", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    80   = { to_port = 80, description = "Entrada http", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    443  = { to_port = 443, description = "Entrada https", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    1337 = { to_port = 1337, description = "Interface Web do Konga", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    8000 = { to_port = 8000, description = "Kong API Gateway", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    8001 = { to_port = 8001, description = "Kong API Gateway", protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }

  }
}

variable "sg-self" {
  description = "Mapa de portas para o mesmo security group"
  type        = map(object({ to_port = number, description = string, protocol = string, self = bool }))
  default = {
    0 = { to_port = 0, description = "Protocolo ICMP para o mesmo sg", protocol = "icmp", self = true }

  }
}

variable "tag-sg" {
  description = "Tag Name do security group"
  type        = string
  default     = "Kong-sg"
}

#
# ec2 instance
#
variable "key_pair" {
  type        = string
  description = "Chave na AWS para se conectar via ssh"
  default     = "curso-devops"
}

variable "type" {
  type        = string
  default     = "t2.micro"
  description = "Type instance"
}

variable "script" {
  type        = string
  description = "caminho do script de instalação"
  default     = "script.sh"
}

variable "ec2_count" {
  type        = number
  description = "Quantidade de instancias Ec2"
  default     = 1
}

variable "tag_instance" {
  type = string
  description = "Tag Name para a instancia"
  default = "Kong"
}