provider "aws" {
    region = "ap-south-1"
}

variable "ami" {
    description = "this is ami for the instance"
}

variable "instance_type" {
    description = "this is the instance_type for example t2.micro"
}

resource "aws_instance" "sample" {
    ami = var.ami
    instance_type = var.instance_type
}

