#output "dns" {
#  value = "${aws_elb.elb.dns_name}"
#}

output "asg_name" {
   value = "${aws_autoscaling_group.asg.name}"
}
