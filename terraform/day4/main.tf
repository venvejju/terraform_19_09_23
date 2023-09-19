provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "vejju_instance" {
    instance_type = "t2.micro"
    ami = "ami-05552d2dcf89c9b24"
    subnet_id="subnet-0d0b3f3943d7480eb"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "vejju-terraform-demo"
}

resource "aws_dynamodb_table" "terraform_lock"{
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
