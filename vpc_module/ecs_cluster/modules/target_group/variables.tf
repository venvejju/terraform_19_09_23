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

variable "vpc_id" {
  description = "vpc_id of the TG"
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


