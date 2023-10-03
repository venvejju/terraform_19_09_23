resource "aws_eip" "ecs_eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "ecs_nat" {
  
  allocation_id = aws_eip.ecs_eip.id
  subnet_id = var.sub_id

}
