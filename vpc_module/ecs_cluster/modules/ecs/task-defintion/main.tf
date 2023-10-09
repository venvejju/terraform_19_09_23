resource "aws_ecs_task_definition" "ecs_task_definition" {
  
  family = var.ecs_family
  network_mode = var.network_mode
  requires_compatibilities = var.ecs_compatibility
  container_definitions = jsonencode([
    {
      name = var.container_name
      image = var.ecs_image
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
  
    }
  ]
  )  


}
