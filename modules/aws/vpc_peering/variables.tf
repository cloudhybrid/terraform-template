variable "peer_owner_id" {}

variable "peer_vpc_id" {}

variable "source_vpc_id" {}

variable "source_vpc_default_sg_id" {
  default = ""
}

variable "source_vpc_route_table_id" {}

variable "source_vpc_cidr" {}

variable "peered_vpc_route_table_id" {}

variable "peered_vpc_cidr" {}

variable "peered_vpc_default_sg_id" {
  default = ""
}
