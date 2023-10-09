output "launch_template_id" {

  description = "ID of the created Launch Template"

  value = aws_launch_template.ecs_lt.id

}

output "lt_instance_type" {
  description = "Instance type of the launch template"
  value = aws_launch_template.ecs_lt.instance_type


}
