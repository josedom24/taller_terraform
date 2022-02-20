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

# Copies the file as the root user using SSH
provisioner "file" {
  source = "index.html"
  destination = "/tmp/index.html"
  connection {
      type = "ssh"
      user = "ubuntu"
      }
}
# Ejecuta remotamente
provisioner "remote-exec" {
  connection {
      type = "ssh"
      user = "ubuntu"
      }
  inline = [
    "sudo apt-get update",
    "sudo apt-get -y install apache2",
    "sudo cp /tmp/index.html /var/www/html",
  ]
}
}