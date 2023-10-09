variable "ecs_compatibility" {
   description = "Compability of the ECS"

}

variable "ecs_family" {
   description = "Family of the ECS, you can mention your own"
}

variable "network_mode" {
   description = "network_mode of the task-definition, bridge, none awsvpc"
}

variable "container_name" {
   description = "NAme of the container"
}

variable "ecs_image" {
   description = "ARN of the ECR" 

}
