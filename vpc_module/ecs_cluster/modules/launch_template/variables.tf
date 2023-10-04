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

variable "subnet_id_lt" {
  description = "Variable created for defining the subnet id related to lt"
}

variable "security_group_ids_lt" {

  description = "List of Security group ids belonging to Launch template"
  type = list(string)
}

variable "use_ssm_role" {
  description = "set true for enabling ssm role in launch template"
  type = bool
}

variable "user_data_file" {
  description = "set true for enabling user data in launch template"
}

variable "user_data_file_path" {
  description = "specify the file path of user daata"

}
