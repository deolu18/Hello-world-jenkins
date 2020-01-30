data "aws_iam_policy_document" "prometheus_task_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type        = "Service"
    }

    effect = "Allow"
  }
}

resource "aws_iam_policy" "prometheus_task_policy" {
  name = "${var.workload_name}-${var.environment_identifier}-task-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "prometheus_task_role" {
  name               = "task-role-${var.workload_name}-${var.environment_identifier}"
  assume_role_policy = "${data.aws_iam_policy_document.prometheus_task_policy.json}"
}

resource "aws_iam_policy_attachment" "prometheus_task_policy_attach" {
  name       = "task-role-${var.workload_name}-${var.environment_identifier}-attach"
  roles      = ["${aws_iam_role.prometheus_task_role.name}"]
  policy_arn = "${aws_iam_policy.prometheus_task_policy.arn}"
}
