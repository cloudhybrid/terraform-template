variable "name" {}

variable "env" {}

variable "project" {}


variable "purpose" {}

variable "nightowl" {}

variable "managedby" {
  default = "terraform"
}

variable "type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "number_of_instances" {
  default = 1
}

variable "key_pair_id" {
  default = ""
}

variable "iam_instance_profile" {
  default = ""
}

variable "ami_id" {
  default = "" 
}

variable "root_volume_type" {
  default = "gp2"
}

variable "root_volume_size" {
  default = "100"
}

variable "security_group_ids" {
  type = "list"
}

variable "zone_id" {}

variable "user_data" {
  default = ""
}
