terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = "t2.micro"
  key_name = "key_jdmr"
  tags = {
    Name = "InstanciaPrueba"
  }
}