variable region{
  default = "eu-west-1"
}
variable account{
  default = ""
}
variable workload{
  default = "helloApplication"
}
variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "private_key_word" {
  default = "mykey"
}

variable "public_key_word" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = ""
  }
}

variable "instance_device_storage" {
  default = "/dev/xvdh"
}

variable "jenkins_vers" {
  default = "2.204.1"
}
