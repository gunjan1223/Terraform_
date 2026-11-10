terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.65.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "Server" {
  ami           = "ami-0f3380f4b6e8b9dd0"
  instance_type = "t3.micro"

  tags = {
    Name = "Server"
  }
}