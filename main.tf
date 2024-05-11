terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  # profile = "default"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  extra_tags = "dev"
}

resource "aws_instance" "guruv1" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  # subnet_id     = "subnet-0cbf30196c1fc3306"
  tags = {
    ExtraTag = local.extra_tags
  }
}