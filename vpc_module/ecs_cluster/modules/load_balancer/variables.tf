variable "elb_type" {
  description = "Type of Elastic Load Balancer"
  type = string
  validation {
    condition = can(regex("^(network|application|gateway)$", var.elb_type))
    error_message = "Valid Options are 'network','Aplication', or 'gateway'."
  }
}
variable "elb_scheme" {
  description = "Load balancer scheme(internet-facing or internal)"
}
variable "elb_security_groups" {
  description = "List of Security groups"
  type = list(string)
}

variable "subnet_id" {
  description = "subnets for load baalancer"
  type = list(string)

}

variable "edp" {
  description = "Variable for enable deletion Protection"
  type = bool

}

variable "elb_ip_address_type" {
  description = "IP Address type"
  type=string
}

variable "elb_name" {
  description = "Name of the elb"
}
variable "target_group_arn" {
  description = "Arn of the target group"

}

variable "ssl_policy" {
  description = "SSL Policy"

}
