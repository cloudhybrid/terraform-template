variable "type" {
  default = "ingress"
}

variable "to_port" {}

variable "from_port" {}

variable "protocol" {
  default = "all"
}


variable "security_group_id" {
  default = ""
}


variable "self_rule" {
  default = "false"
}
