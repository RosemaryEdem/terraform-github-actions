terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}

# s3 bucket
resource "aws_s3_bucket" "app_bucket" {
    bucket = var.bucket_name

    tags = {
        Name = var.bucket_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
}

# EC2 instance
data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}
resource "aws_instance" "web_server"{
    ami = data.aws_ami.amazon_linux.id
    values = var.instance_type

    tags = {
        Name = "${var.environment}-web-server"
        Envionment = var.environment
        ManagedBy = "terraform"
    }
}
