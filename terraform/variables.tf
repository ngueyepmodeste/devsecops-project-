variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ami" {
  type = string
  default = "ami-053b0d53c279acc90"
}

variable "key_name" {
  type = string
  description = "Nom du Key Pair AWS"
  default = "alpha-one_key"
}