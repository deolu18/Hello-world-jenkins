variable "workload" {}

variable "vpc_prefix" {}
variable "hello-world-task-name"
variable "region" {}
variable "loggroup_name" {}
variable "cluster_name" {}
variable "role_name" {}
variable "account_number" {}
variable "account" {}
variable "public_elb_sg_name" {}
variable "instance_sg_name" {}
variable "allowed_cidrs" {}
variable "egress_cidrs" {
  default = "0.0.0.0/0"
}

variable "private_network_cidr" {
  default = "10.0.0.0/16"
}


