terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  secrity_group_name = var.security_group_name
  security_group = var.aws_security_group
  vpc_id = var.vpc_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  iam_instance_profile = var.aws_iam_instance_profile.terraform_profile.name
  user_data = file("./user-data.sh")
  
  tags = {
    Name = var.name
    Env = var.env
    System = var.system
  }
}

