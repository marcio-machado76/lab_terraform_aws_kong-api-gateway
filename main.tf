provider "aws" {
  region  = var.region
  profile = "terraform"
}


module "network" {
  source          = "./network"
  region          = var.region
  cidr            = var.cidr
  count_available = var.count_available
  vpc             = module.network.vpc
  tag_vpc         = var.tag_vpc
  tag_igw         = var.tag_igw
  tag_rtable      = var.tag_rtable
  nacl            = var.nacl
}

module "security-group" {
  source  = "./security_group"
  vpc     = module.network.vpc
  sg-self = var.sg-self
  sg-cidr = var.sg-cidr
  tag-sg  = var.tag-sg
}

module "ec2-instance" {
  source        = "./ec2"
  sg-sgid       = module.security-group.sg-sgid
  public_subnet = module.network.public_subnet
  script        = var.script
  key_pair      = var.key_pair
  type          = var.type
  ec2_count     = var.ec2_count
  tag_instance  = var.tag_instance
}
