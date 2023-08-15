provider "aws" {
  region = "us-east-1"
}

# Networking
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_info.vpc_name
  cidr = var.vpc_info.vpc_cidr

  azs             = var.vpc_subnet_info.azs
  private_subnets = var.vpc_subnet_info.private_subnet_blocks
  public_subnets  = var.vpc_subnet_info.public_subnet_blocks

  map_public_ip_on_launch = true
  enable_nat_gateway      = true
  nat_eip_tags = {
    "Name" = "nat-EIP"
  }
  nat_gateway_tags = {
    "Name" = "natgw"
  }

  create_igw = true
  igw_tags = {
    "Name" = "igw-main"
  }
}

resource "aws_security_group" "allow_web_sg" {
  name = "security group from terraform"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


