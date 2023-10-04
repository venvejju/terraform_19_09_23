resource "aws_lb_target_group" "ecs_tg" {
   name = var.tg_name
   port = var.port
   protocol = var.protocol
   vpc_id = var.vpc_id
   target_type = var.use_ip_as_target ? "ip" : "instance"
   health_check {
       enabled = true
       interval = var.interval
       path = var.path
       port = var.health_check_port
       protocol = var.health_check_protocol
       healthy_threshold = var.healthy_threshold
       unhealthy_threshold = var.unhealthy_threshold
       timeout = var.timeout
      

   }
}

resource "aws_lb_target_group_attachment" "ecs_tg_att" {
   count = var.use_ip_as_target ? 0: length(var.instances)
   target_group_arn = aws_lb_target_group.ecs_tg.arn 
   target_id = var.instances[count.index] 
}
