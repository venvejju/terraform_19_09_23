output "tg_id" {
  description = "ID of target group"
  value = aws_lb_target_group.ecs_tg.id
}

output "tg_arn" {

  description = "Arn of the target group"
  value = aws_lb_target_group.ecs_tg.arn

}
