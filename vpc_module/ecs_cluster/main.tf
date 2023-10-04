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

module "sec_group" {

    source = "./modules/security_group"
    ecs_ec2_name = var.ecs_ec2_name
    ecs_alb_name = var.ecs_alb_name
    vpc_id = module.vpc.vpc_id


}

module "ecs_iam" {
    source = "./modules/iam"
    task_exec_role_name = var.task_exec_role_name
    task_exec_policy_name = var.task_exec_policy_name
    inst_role_name = var.inst_role_name
    ecs_policy_name = var.ecs_policy_name
    ecs_role_name = var.ecs_role_name


}

module "ecs_lt" {
    source = "./modules/launch_template"
    lt_name = var.lt_name
    launch_template_description = var.launch_template_description
    use_custom_ami = var.use_custom_ami
    custom_ami_id = var.custom_ami_id
    lt_instance_type = var.lt_instance_type
    use_key_pair = var.use_key_pair
    key_pair_name_lt = var.key_pair_name_lt
    use_custom_block_device = var.use_custom_block_device
    device_name = var.device_name
    volume_size = var.volume_size
    create_network_interfaces = var.create_network_interfaces
    subnet_id_lt = module.subnets.subnet_id[*]
    security_group_ids_lt = [module.sec_group.ec2_sg_id, module.sec_group.alb_sg_id]
    use_ssm_role = var.use_ssm_role
    user_data_file = var.user_data_file
    user_data_file_path = var.user_data_file_path
}

module "target_group" {
    source = "./modules/target_group"
    vpc_id = module.vpc.vpc_id
    tg_name = var.tg_name
    port = var.port
    protocol = var.protocol
    interval = var.interval
    path=var.path
    health_check_port = var.health_check_port
    health_check_protocol = var.health_check_protocol
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    instances = ["i-02bcfc71dfdf63333","i-0d09c6fa72e145684"]
    use_ip_as_target = var.use_ip_as_target

}
