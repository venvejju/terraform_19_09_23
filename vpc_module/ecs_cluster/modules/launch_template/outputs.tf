output "launch_template_id" {

  description = "ID of the created Launch Template"

  value = aws_launch_template.ecs_lt.id

}
