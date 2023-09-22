variable "access_key" {
    default = ""
}

variable "secret_key" {
  default = ""
}

variable "image_id" {
  default = ""
}

variable "key_name" {
  default = ""
}

variable "region" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "name" {
  default = ""
}

variable "system" {
  default = ""
}

variable "env" {
  default = ""
}

variable "security_group" {
  default = ""
}

variable "iam_instance_profile" {
  default = "aws_iam_instance_profile.terraform_profile.name"
}
variable "vpc_security_group_ids" {
  default = "vpc_security_group_ids"
}
variable " vpc_id" {
  default = " vpc_id"
}
variable "security_group_name" {
  default = "security_group_name"
}