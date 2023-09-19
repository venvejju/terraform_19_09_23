terraform{
    backend "s3" {
        bucket = "vejju-terraform-demo"
        region = "ap-south-1"
        key = "vejju/terraform.tfstate"
        dynamodb_table = "terraform_lock"
    }
}
