# aws_rds

This resource creates the Mysql-RDS in AWS, can be used in module form to make it
reusable across the project.


Below RDS module can be looked at for the reference.

```
module "mysql_rds" {
   source = "../modules/rds_mysql"
   subnet_list = ["${module.pvt_subnet_aza.id}", "${module.pvt_subnet_azb.id}"]
   rds_security_group_ids = ["${module.pub_http_sg.id}", "${module.vpc.default_sg_id}"]
   rds_instance_name = "${var.rds_instance_identifier}"
   database_name = "${var.database_name}"
   rds_allocated_storage = "${var.rds_storage}"
   database_user = "${var.database_user}"
   database_password = "${var.database_password}"
   publicly_accessible = "${var.publicly_accessible}"

}
```
