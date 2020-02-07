resource "aws_cloudwatch_log_group" "hellow-logs" {
  name = "${var.aws_log_group_hello_world}"
}

locals {
  hellow_ecs_task_name = "adehelloworldapplication-${var.region}"
}
resource "aws_ecs_task_definition" "hello-world" {
  family                = "helloworld-${var.region}"
  container_definitions = <<DEFINITION
[
  {
    "name": "${local.hellow_ecs_task_name}",
    "image": "${var.account_number}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_image_repo_name}:${var.image_tag}",
    "memory": 512,
    "user": "root",
    "logConfiguration": {	
      "logDriver": "awslogs",	
      "options": {	
        "awslogs-group": "${var.aws_log_group_hello_world}",	
        "awslogs-region": "${var.region}"	,
        "awslogs-stream-prefix": "awslogs-hello"
      }
    }
  }
]
DEFINITION
}
