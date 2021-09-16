variable "key_pair" {
  type        = string
  description = "Chave para se conectar ssh"
}

variable "type" {
  type        = string
  description = "Type instance"
}

variable "script" {
  type        = string
  description = "caminho do script de instalação"
}

variable "sg-sgid" {
  type        = string
  description = "Security group id"
}

variable "public_subnet" {
  description = "Subnet public id"
}

variable "ec2_count" {
  description = "Quantidade de instancias Ec2"
}

variable "tag_instance" {
  type        = string
  description = "Tag Name para a instancia"
}
