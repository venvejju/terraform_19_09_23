 resource "aws_subnet" "subnet_ecs" {
    count = length(var.subnet_cidrs)
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]

}

resource "aws_subnet" "private" {
    count = length(var.azs)
    availability_zone = element(var.azs,count.index)
    vpc_id = var.vpc_id
    cidr_block = element(var.prvcidr,count.index)
    tags = {
        "Name" = "private-${count.index+1}"
    }
}

resource "aws_subnet" "public" {
    count = length(var.azs)
    availability_zone = element(var.azs,count.index)
    vpc_id = var.vpc_id                              
    cidr_block = element(var.pubcidr,count.index)
    map_public_ip_on_launch = true
    tags = {
        "Name" = "public-${count.index+1}"
    }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public.*.id)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = var.route_table_pub_id
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private.*.id)
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = var.route_table_private_id
  
}
