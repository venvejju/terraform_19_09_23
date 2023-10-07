variable "asg_name" {
  description = "Name of the asg"

}

variable "asg_lt_id"{
  description = "Variable for the launch template id"
}

variable "vpc_zone_identifier"{
  description = "List of subnets present in the vpc"
  type = list(string)
}

variable "max_size"{
  description = "max_size of the asg"
}

variable "min_size"{
  description = "min_size of the asg"
}

variable "desired_capacity"{
  description = "desired_capacity of the asg"
}

variable "health_check_type"{
  description = "health_check_type of the asg"
}

variable "enable_target_group"{
  description = "Variable for target_group enablement"
  type = bool
}


variable "target_group_arn"{
  description = "target_group_arn"
}

