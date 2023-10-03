provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr 
    
}

module "subnets" {
    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    subnet_cidrs = var.subnet_cidrs
    prvcidr = var.prvcidr
    pubcidr = var.pubcidr
    azs = var.azs
    route_table_pub_id = module.route_table.rt_id
    route_table_private_id = module.route_table_private.rt_private_id

}

module "igw" {
    source = "./modules/igw"
    depends_on = [
        module.vpc
    ]
    vpc_id = module.vpc.vpc_id
  

}

module "route_table" {
    source = "./modules/route_table"
    depends_on = [
      module.igw
    ]
    igw_cidr = var.igw_cidr
    igw_gateway_id = module.igw.igw_id    
    vpc_id = module.vpc.vpc_id

}

module "route_table_private" {
    source = "./modules/rt_private"
    vpc_id = module.vpc.vpc_id
}

module "ngw" {
    depends_on = [
      module.subnets.prvcidr
    ]
    source = "./modules/ngw"
    sub_id = module.subnets.subnet_id[0]



}

module "route" {
    source = "./modules/route"
    route_table_id = module.route_table_private.rt_private_id
    nat_gateway_id = module.ngw.ngw_id 

}
