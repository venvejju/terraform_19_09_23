variable "ecs_service_name" {
   description = "Name of the ECS Service"

}

variable "ecs_cluster_id" {
   description = "Id of the ecs cluster"
}

variable "ecs_task_definition_arn" {
   description = "ARN of the ecs task definition"
}

variable "count_container" {
   description = "Count of the containers"
}

variable "service_iam_role" {
   description = "IAM Role for the service" 

}

variable "ecs_target_group_arn" {
   description = "ARN of the target group"

}
