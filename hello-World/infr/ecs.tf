resource "aws_ecr_repository" "hellow_repo" {
  name = "helloworldcontainerrepo"
}


resource "aws_ecs_cluster" "hello" {
  name = "adehelloworld"
}


resource "aws_ecs_service" "hellur" {
  name            = "helloservice"
  cluster         = "${aws_ecs_cluster.hello.id}"
  task_definition = "${aws_ecs_task_definition.hello_world.arn}"
  desired_count   = 1
}
