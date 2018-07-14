variable "type" {
  default = "ingress"
}

variable "to_port" {}

variable "from_port" {}

variable "protocol" {
  default = "all"
}

variable "cidr_block" {
  default = ["0.0.0.0/0"]
}

variable "security_group_id" {
  default = ""
}


