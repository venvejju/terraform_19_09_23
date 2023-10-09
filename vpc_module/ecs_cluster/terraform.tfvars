vpc_cidr="10.0.0.0/16"
subnet_cidrs=["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
azs=["ap-south-1a","ap-south-1b","ap-south-1c"]
prvcidr=["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
pubcidr=["10.0.6.0/24","10.0.7.0/24","10.0.8.0/24"]
igw_cidr="0.0.0.0/0"
ecs_ec2_name="ecs_ec2_sg"
ecs_alb_name="ecs_alb_sg"
task_exec_role_name="ecsTaskExecution_role"
task_exec_policy_name="ecsTaskExecPolicy"
inst_role_name="ecsinstance_role"
ecs_policy_name="ecspolicy"
ecs_role_name="ecs_role"
lt_name ="ecs_lt"
launch_template_description = "This is being created for ecs cluster"
use_custom_ami  = true
custom_ami_id  = "ami-05552d2dcf89c9b24"
lt_instance_type = "t2.medium"
use_key_pair = true
key_pair_name_lt = "tf_instance"
use_custom_block_device = true
device_name = "/dev/sda1"
volume_size = "30"
create_network_interfaces = true
use_ssm_role = true
user_data_file = true
user_data_file_path = "./policies/userdata.tpl"
tg_name = "ecs-target-group"
port = "80"
protocol = "HTTP"
interval = "30"
path="/"
health_check_port = "traffic-port"
health_check_protocol = "HTTPS"
healthy_threshold = "5"
unhealthy_threshold ="2"
timeout = "5"
instances = ["i-016ca7f100e6848be","i-0a6cdc3e1b853b4a9"]
use_ip_as_target = false
elb_type = "application" 
elb_scheme = "internet-facing"
#elb_security_groups = []
elb_ip_address_type = "ipv4"
#elb_listeners=[
#       {
#          elb_port = var.elb_port_ttp
#          elb_protocol = var.elb_protocol_ttp
#          target_group_arn = module.target_group.tg_arn

#       },
#       {
#          elb_port = var.elb_port_ttps
#          elb_protocol = var.elb_protocol_ttps
#          target_group_arn = module.target_group.tg_arn

#       }
#    ]
elb_name = "ecs-lb"
edp=false

ssl_policy ="ELBSecurityPolicy-2016-08"
asg_name="ecs-asg" 
max_size="4" 
min_size="1" 
desired_capacity="1" 
health_check_type="EC2" 
enable_target_group=true 
cluster_name="cluster-initial"
ecs_cp_name="initial-cp"
managed_scaling_status="DISABLED"
ecs_region = "ap-south-1"
ecs_compatibility = ["EC2"]
ecs_family = "Service"
network_mode = "bridge"
container_name = "nginx-container"
ecs_image = "868069081965.dkr.ecr.ap-south-1.amazonaws.com/dev-ecs:1"
ecs_service_name = "nginx-service"
count_container = 3
