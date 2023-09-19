provider "aws" {
    region = "ap-south-1" # Set your desired region
}

resource "aws_instance" "terraform_created_instance" {
    ami = "ami-05552d2dcf89c9b24" #Set your own ami
    instance_type = "t2.micro"
    subnet_id = "subnet-0d0b3f3943d7480eb"
    key_name = "tf_instance"
}
