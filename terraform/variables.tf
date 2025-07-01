variable "aws_region" {
  type = string
  default = "eu-west-3"
}

variable "instance_type" {
  type = string
  default = "t2.medium"
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
  description = "Nom du Key Pair AWS"
  default = "devsecops-key"
}