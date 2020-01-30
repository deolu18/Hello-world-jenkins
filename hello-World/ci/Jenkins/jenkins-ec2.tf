data "template_file" "user_data_master" {
  template = "${file("user-data/jenkins.tpl")}"

  vars = {
    efs_dns_name    = "${var.efs_dns_name}"
    ebs_device_name = "${var.ebs_device_name}"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_key_pair" "jenkins_stack_key_pair" {
  key_name   = "${var.workload }_${var.account}"
  public_key = "${var.public_key}"
}

# jenkins master instance
resource "aws_instance" "jenkins_stack_master" {
  ami                    = "${data.aws_ami.jenkins.id}"
  key_name               = "${var.workload }_${var.account}"
  vpc_security_group_ids = data.aws_security_groups.jenkins_main_instance_sg.ids
  subnet_id              = data.aws_subnet_ids.private.ids
  iam_instance_profile   = "${data.aws_iam_instance_profile.jenkins_instance_profile.name}"
  user_data              = "${data.template_file.user_data_master.rendered}"

  tags = {
    Name     = "${var.workload}_${var.account}"
    account  = "${var.account }"
    workload = "${var.workload}"
  }
}

resource "aws_elb_attachment" "jenkins_elb_instance_attachment" {
  elb      = "${data.aws_elb.jenkins_main_elb.id}"
  instance = "${aws_instance.jenkins_stack_master.id}"
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = "${var.ebs_device_name}"
  volume_id   = "${data.aws_ebs_volume.jenkins_ebs.id}"
  instance_id = "${aws_instance.jenkins_stack_master.id}"
}
