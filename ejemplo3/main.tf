terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0892d3c7ee96c0bf7"
  instance_type = "t2.micro"
  key_name = var.key
  tags = {
    Name = var.instance_name
  }

# Copies the file as the root user using SSH
  provisioner "file" {
    source = "index.html"
    destination = "/tmp/index.html"
    connection {
        type = "ssh"
        user = "ubuntu"
        host =  self.public_ip
        private_key = file(pathexpand("~/.ssh/id_aws"))
        }
  
}

  provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "ubuntu"
        host =  self.public_ip
        private_key = file(pathexpand("~/.ssh/id_aws"))
        }
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install apache2",
      "sudo cp /tmp/index.html /var/www/html",
    ]
  }
}

