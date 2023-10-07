output "elb_dns_name" {

  value = aws_lb.ecs_elb.dns_name

}
output "elb_arn" {

  value = aws_lb.ecs_elb.arn

}
