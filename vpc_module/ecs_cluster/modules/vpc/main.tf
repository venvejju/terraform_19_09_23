resource "aws_vpc" "vpc_ecs" {
    cidr_block = var.vpc_cidr
   #instance_tenancy = var.tenancy         
    tags = {
      "Name" = "Ecs-Vpc"
    }
  
}
