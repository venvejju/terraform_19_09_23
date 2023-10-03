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



#variable "sub_id" {
#  description = "this is being created to get the subnet details for attaching nat gateway"

#}
