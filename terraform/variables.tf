variable "aws_region" {
  type = string
  default = "eu-west-3"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  description = "Nom du Key Pair AWS"
  default = "devsecops-key"
}