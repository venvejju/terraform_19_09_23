resource "aws_ecs_service" "worker" {
  name            = var.ecs_service_name
  cluster         = var.ecs_cluster_id
  task_definition = var.ecs_task_definition_arn
  desired_count   = var.count_container
  iam_role          = var.service_iam_role
  load_balancer {
      target_group_arn = var.ecs_target_group_arn
      container_name = "nginx-container"
      container_port = 80
  }
}
