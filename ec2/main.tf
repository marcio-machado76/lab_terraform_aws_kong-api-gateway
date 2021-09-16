#################
# Instancias EC2
#################
data "aws_ami" "ubuntu" {
  most_recent = true
  name_regex  = "ubuntu"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu 
}

resource "aws_instance" "ec2" {

  count           = var.ec2_count
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.type
  user_data       = filebase64(var.script)
  key_name        = var.key_pair
  security_groups = [var.sg-sgid]
  subnet_id       = var.public_subnet[count.index]

  tags = {
    Name = "${var.tag_instance}-${count.index + 1}"
  }
}
