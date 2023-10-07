resource "aws_autoscaling_group" "ecs_asg" {
   name_prefix = var.asg_name
   launch_template {
      id = var.asg_lt_id
      version = "$Latest"
   }
   vpc_zone_identifier = var.vpc_zone_identifier
   max_size = var.max_size
   min_size = var.min_size
   desired_capacity = var.desired_capacity
   health_check_type = var.health_check_type
   health_check_grace_period = 300
   default_cooldown = 60

}

resource "aws_autoscaling_attachment" "ecs_asg_attachment" {
   
   count = var.enable_target_group ? 1 : 0
   autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
   lb_target_group_arn = var.target_group_arn
}


