resource "aws_ecs_task_definition" "helloworrld_task_definition" {
  family                = "${var.workload}-${var.account}"
  container_definitions = <<DEFINITION
[
  {
    "name": "${var.hello-world-task-name}",
    "image": "${var.account_number}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_image_repo_name}:${var.image_tag}@${data.aws_ecr_image.hello_wrld.image_digest}",
    "memory": 512,
    "user": "root",
    "mountPoints": [
      {
        "sourceVolume": "helloWorld",
        "containerPath": "/hello-w"
      }
    ],
    "environment": [
        {
            "name": "",
            "value": "" 	// can add more environment variables as needed
        },
    ],
    // add logs incase of any errors so the logs can be seen in cloudwatch
    "logConfiguration": {	
      "logDriver": "awslogs",	
      "options": {	
        "awslogs-group": "${var.loggroup_name}",	
        "awslogs-region": "${var.region}"	,
        "awslogs-stream-prefix": "awslogs-pro-hello"
      }
    }
  }
]
  volume {
    name      = "helloWorld"
    host_path = "/hello-w"
  }
}


