resource "aws_route_table" "public" {
    vpc_id = var.vpc_id
    route {
    	cidr_block = var.igw_cidr
    	gateway_id = var.igw_gateway_id
    }
    tags = {
    	"Name" = "pub-routes"
    }
}


