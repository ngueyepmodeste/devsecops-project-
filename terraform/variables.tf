variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t3.medium"
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

variable "pem_path" {
  description = "Chemin vers la clé privée PEM"
  default = "/root/.ssh/alpha-one_key.pem" # Attention, ce chemin sera créé par le pipeline
}
