
variable "rds_instance_name" {}

variable "rds_is_multi_az" {
    #if we want our rds to be single AZ then change the default value to "false"
    default = "true"
}


variable "rds_storage_type" {
    #This the storage type weather we want "standard" or "provisioned IOPS"
    default = "standard"
}


variable "rds_allocated_storage" {
    description = "The allocated storage in GBs"
    # we just have to give the storage capicity here like "10" for 10 gb storage
}


variable "rds_engine_type" {
    # Valid types are
    # - mysql
    # - postgres
      default  = "mysql"
}


variable "rds_engine_version" {
    #This is engine version we want to install to..
    default = "5.6.22"
}


variable "rds_instance_class" {
    default  = "db.t2.micro"
}


variable "backup_window" {
    default  = ""
}


variable "maintenance_window" {
    default  = ""
}


variable "backup_retention_period" {
    default  = ""
}


variable "database_name" {
    description = "The name of the database to create"

}



variable "database_user" {}


variable "database_password" {}


variable "publicly_accessible" {
    #if you want rds to be public then just change the default value to "true"
    default = "false"
}


variable "subnet_list" {
  type = "list"
}


variable "aws_region" {
   default = ""
}


variable "rds_security_group_ids" {
  type = "list"
}

variable "max_connection" {
  default = ""
}

variable "query_cache_type" {
  default = ""
}

variable "innodb_log_buffer_size" {
  default = ""
}

variable "query_cache_size" {
  default = ""
}

variable "key_buffer_size" {
  default = ""
}

variable "storage_encrypted" {
  default = "false"
}

variable "log_bin_trust_function_creators" {
  default = ""
}

variable "time_zone" {
  default = ""
}
