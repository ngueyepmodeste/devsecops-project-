variable "aws_region" {
  type = string
  default = "eu-west-2"
}

variable "instance_type" {
  type = string
  default = "m5d.xlarge"
}
variable "key_name" {
  type = string
  description = "Nom du Key Pair AWS"
  default = "devsecops2-key"
}