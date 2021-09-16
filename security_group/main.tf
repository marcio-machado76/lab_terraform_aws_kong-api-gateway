resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc

  ###############
  # Inbound  TCP
  ###############
  dynamic "ingress" {
    for_each = var.sg-cidr
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "ingress" {
    for_each = var.sg-self
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      self        = ingress.value["self"]
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound all "

  }

  tags = {
    Name = var.tag-sg
  }
}
