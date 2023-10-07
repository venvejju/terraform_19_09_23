resource "aws_lb" "ecs_elb" {
   name = var.elb_name
   internal = var.elb_scheme == "internal" ? true : false
   load_balancer_type = var.elb_type
   ip_address_type = var.elb_ip_address_type
   security_groups = var.elb_security_groups
   subnets = var.subnet_id
   enable_deletion_protection = var.edp
   

}

#resource "aws_lb_listener" "https_listener" {
#  load_balancer_arn = aws_lb.ecs_elb.arn
#  port              = "443"
#  protocol          = "HTTPS"
#  ssl_policy        = var.ssl_policy
#  certificate_arn   = "arn:aws:acm:ap-south-1:868069081965:certificate/8c3d6540-2b50-4217-86a9-0591c604ef4b"

#  default_action {
#    type             = "forward"
#    target_group_arn = var.target_group_arn
#  }
#}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.ecs_elb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = var.ssl_policy
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
