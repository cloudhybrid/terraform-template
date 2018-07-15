
resource "aws_db_instance" "main_rds_instance" {
    identifier = "${var.rds_instance_name}"
    allocated_storage = "${var.rds_allocated_storage}"
    engine = "${var.rds_engine_type}"
    engine_version = "${var.rds_engine_version}"
    instance_class = "${var.rds_instance_class}"
    name = "${var.database_name}"
    username = "${var.database_user}"
    password = "${var.database_password}"
    vpc_security_group_ids = ["${var.rds_security_group_ids}"]
    db_subnet_group_name = "${aws_db_subnet_group.main_db_subnet_group.name}"
    parameter_group_name  = "${aws_db_parameter_group.parameter_group.name}"
    multi_az = "${var.rds_is_multi_az}"
    storage_type = "${var.rds_storage_type}"
    publicly_accessible = "${var.publicly_accessible}"
    skip_final_snapshot = "true"
    #apply_immediately = "true"
    backup_window = "${var.backup_window}"
    maintenance_window = "${var.maintenance_window}"
    backup_retention_period = "${var.backup_retention_period}"
    storage_encrypted = "${var.storage_encrypted}"

}


resource "aws_db_subnet_group" "main_db_subnet_group" {
    name = "${var.rds_instance_name}-subnetgrp"
    description = "RDS subnet group"
    subnet_ids = ["${var.subnet_list}"]
}

resource "aws_db_parameter_group" "parameter_group" {
  name = "${var.rds_instance_name}-parametergrp"
  description = "Increase max connection count"
  family = "mysql5.7"

  parameter {
    name = "max_connections"
    value = "${var.max_connection}"
    apply_method = "pending-reboot" 
    #immediate is default
    #Some engines can't apply some parameters without a reboot, and you will need to specify "pending-reboot" here
  }

  parameter {
    name = "query_cache_type"
    value = "${var.query_cache_type}"
    apply_method = "pending-reboot"
  }

  parameter {
    name = "innodb_log_buffer_size"
    value = "${var.innodb_log_buffer_size}"
    apply_method = "pending-reboot"
  }

  parameter {
    name = "query_cache_size"
    value = "${var.query_cache_size}"
    apply_method = "pending-reboot"
  }

  parameter {
    name = "key_buffer_size"
    value = "${var.key_buffer_size}"
    apply_method = "pending-reboot"
  }
 
 parameter {
    name = "log_bin_trust_function_creators"
    value = "${var.log_bin_trust_function_creators}"
    apply_method = "pending-reboot"
  }

 parameter {
    name = "time_zone"
    value = "${var.time_zone}"
    apply_method = "pending-reboot"
  }

}
