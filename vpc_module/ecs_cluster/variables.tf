variable "vpc_cidr" {
  description = "This is an ami value description"


}

variable "subnet_cidrs" {

  description = "List of subnet cidrs"
  type = list(string)

}

variable "azs" {

  description = "List of availability zones"
  type = list(string)


}
variable "prvcidr" {

  description = "List of subnet cidrs"
  type = list(string)

}
variable "pubcidr" {

  description = "List of subnet cidrs"
  type = list(string)

}

variable "igw_cidr" {
  description = "cidr of igw for public route table"
  

}

variable "ecs_ec2_name" {
   description = "this variable is created for ecs ec2 security grop"


}

variable "ecs_alb_name" {
   description = "this variable is created for name of ecs alb securty group"

}

#variable "sub_id" {
#  description = "this is being created to get the subnet details for attaching nat gateway"

#}

variable "task_exec_role_name" {

    description = "This is created for iam of ecs task exec role name"

}
variable "task_exec_policy_name" {

    description = "This is created for iam of ecs task exec policy name"

}


variable "inst_role_name" {

    description = "This is created for iam of ecs instance role name"

}

variable "ecs_policy_name" {

    description = "This is created for iam of ecs policy name"

}

variable "ecs_role_name" {

    description = "This is created for iam of ecs role name"

}


variable "lt_name" {

  description = "This variable is craeted for defining launch template name"

}

variable "launch_template_description" {
  description = "This variable is craeted for defining launch template description"

}

variable "use_custom_ami" {
  description = "Set true to enable ami"
  type = bool

}

variable "custom_ami_id" {
    description = "Variable created for defining custom_ami_id for lauunch template"
}

variable "lt_instance_type" {
    description = "Variable created for describing instance type of launch template"
}

variable "use_key_pair" {
  description = "Set true to enable Key Pair"
  type = bool

}
variable "key_pair_name_lt" {
  description = "Variable created for giving the keypair name for launch template"
}

variable "use_custom_block_device" {
  description = "Set true to use Custom block devices for launch template"  
  type = bool
}

variable "device_name" {
  description = "Variable created for naming the block storage in the block device mapping of launch template"
}

variable "volume_size" {
  description = "Variable created for defining the volume size in launch template"
}

variable "create_network_interfaces" {
  description = "set true to create network interfaces in launch template"
  type = bool
}

#variable "subnet_id_lt" {
#  description = "Variable created for defining the subnet id related to lt"
#}

#variable "security_group_ids_lt" {

#  description = "List of Security group ids belonging to Launch template"
#  type = list(string)
#}

variable "use_ssm_role" {
  description = "set true for enabling ssm role in launch template"
  type = bool
}

variable "user_data_file" {
  description = "set true for enabling user data in launch template"
  default = false
}

variable "user_data_file_path" {
  description = "specify the file path of user daata"

}

variable "instances" {
   type = list(string)
   description = "list of instances that should be attached to tg"

}

variable "tg_name" {
  description = "Name of the TG"
}

variable "port" {
  description = "port of the TG"
}

variable "protocol" {
  description = "protocol of the TG"
}


variable "use_ip_as_target" {
  description = "check true if you want to use target type as IP"
  type = bool
  default = false
}

variable "interval" {
  description = "Health Check interval of the TG"
}

variable "path" {
  description = "Health Check path of the TG"
}

variable "health_check_port" {
  description = "health_check_port of the TG"
}

variable "health_check_protocol" {
  description = "health_check_protocol of the TG"
}

variable "healthy_threshold" {
  description = "healthy_threshold of the TG"
}

variable "unhealthy_threshold" {
  description = "unhealthy_threshold of the TG"
}

variable "timeout" {
  description = "Health check timeout of the TG"
}

