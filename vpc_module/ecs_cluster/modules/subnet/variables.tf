variable "vpc_id" {

  description = "ID of the VPC"


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

variable "route_table_pub_id" {
  description = "public route table associated to the public subnet"

}

variable "route_table_private_id" {

  description = "private route table associated to be private subnet"

}
