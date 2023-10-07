output "ec2_sg_id" {
  description = "Value of the security group id"
  value = aws_security_group.ecs_ec2_sg.id

}

output "alb_sg_id" {
  description = "Value of the security group id"
  value = aws_security_group.ecs_ec2_sg.id

}
