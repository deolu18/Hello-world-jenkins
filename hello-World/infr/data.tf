data "aws_ecs_cluster" "helllo" {
  cluster_name = "${var.cluster_name}"
}

data "aws_ecs_service" "helo" {
  service_name = "example"
  cluster_arn  = "${data.aws_ecs_cluster.helllo.arn}"
}

data "aws_ecr_image" "hello_wrld" {
  repository_name = "${var.ecr_image_repo_name}"
  image_tag = "${var.image_tag}"
}


data "aws_iam_role" "role" {
  name = "${var.role_name}"
}


data "aws_instances" "world_instances" {
  instance_tags = {
    instance_name = "WORLD"
  }
}


data "aws_security_groups" "instance_security" {
  tags = {
    cluster_name     = "${var.cluster_name}"
    workload    = "${var.workload}"
    environment_name = "${var.account}"
  }
}


data "aws_vpcs" "vpc" {
  tags = {
    Name = "${var.vpc_prefix}"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpcs.vpc.ids

  tags = {
    tier = "Private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpcs.vpc.ids

  tags = {
    tier = "Public"
  }
}
