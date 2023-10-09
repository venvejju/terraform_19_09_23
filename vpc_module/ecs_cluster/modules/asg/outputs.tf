output "asg_arn" {

   description = "asg arn"
   value = aws_autoscaling_group.ecs_asg.arn


}

output "asg_dc_count" {
   description = "asg_dc_count"
   value = aws_autoscaling_group.ecs_asg.desired_capacity

}
