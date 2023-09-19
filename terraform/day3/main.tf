provider "aws" {
    region = "ap-south-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value="ami-05552d2dcf89c9b24"
    subnet_id_value="subnet-0d0b3f3943d7480eb"
    instance_type_value="t2.micro" 
}


