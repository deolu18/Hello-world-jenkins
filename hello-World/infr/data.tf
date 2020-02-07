data "aws_ecr_image" "helloworld" {
  repository_name = "${var.ecr_image_repo_name}"
  image_tag = "${var.image_tag}"
}
