data "aws_iam_policy_document" "ecs_task-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "ecsTaskExecution_role" {
  name               = var.task_exec_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_task-assume-role-policy.json
}
resource "aws_iam_role_policy" "ecsTaskExecution_policy" {
  name = var.task_exec_policy_name
  role = aws_iam_role.ecsTaskExecution_role.id
  policy = file("policies/ecsTaskExecutionPolicy.json")
}





#ecs role for Ec2 instance

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsinstance_role" {
  name               = var.inst_role_name
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}
resource "aws_iam_role_policy" "ecspolicy" {
  name = var.ecs_policy_name
  role = aws_iam_role.ecsinstance_role.id
  policy = file("policies/ecsInstancePolicy.json")
}
  resource "aws_iam_instance_profile" "ecs_role" {
  name = var.ecs_role_name
  role = aws_iam_role.ecsinstance_role.name
}

