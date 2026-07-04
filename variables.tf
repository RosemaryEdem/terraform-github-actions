variable "aws_region" {
    description = "AWS region to deploy resources"
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "environment" {
    description = "Deployment environment"
    type = string
    default = "dev"
}

variable "bucket_name" {
    description = "Name of S3 bucket"
    type = string
    default = "rosie-tf-cicd-bucket26
}