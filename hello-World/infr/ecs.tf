variable "workload_name" {}
variable "environment_identifier" {}
variable "account_name" {}

variable "vpc_prefix" {}
variable "region" {}

variable "loggroup_name" {}
variable "cluster_name" {}

variable "role_name" {}
variable "cloudwatch_port" {}

variable "account_number" {}

# variable "name" {}
variable "tag" {}

variable "public_elb_sg_name" {}
variable "instance_sg_name" {}
variable "allowed_cidrs" {}

variable "egress_cidrs" {
  default = "0.0.0.0/0"
}

variable "accounts" {
}

variable "private_network_cidr" {
  default = "10.0.0.0/16"
}


