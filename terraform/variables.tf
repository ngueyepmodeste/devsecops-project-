variable "aws_region" {
  type = string
  default = "eu-west-3"
}

variable "instance_type" {
  type = string
  default = "t3.medium"
}

variable "ami" {
  type = string
  default = "ami-0c02fb55956c7d316"
}

variable "key_name" {
  type = string
  description = "Nom du Key Pair AWS"
  default = "alpha-one_key"
}

variable "pem_path" {
  description = "Chemin vers la clé privée PEM"
  default = "/root/.ssh/alpha-one_key.pem" # Attention, ce chemin sera créé par le pipeline
}
