variable "aws_region" {
  default = "ap-south-1"
}

variable "cidr" {
  default = "10.10.0.0/16"
}

variable "pub_sn_cidr" {
  default = "10.10.6.0/25"
}

variable "pvt_sn_cidr" {
  default = "10.10.4.0/23"
}

variable "vpc_name" {
  default = "sandy-test"
}

variable "pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "sn_cidr" {
  default = "10.10.0.0/16"
}
