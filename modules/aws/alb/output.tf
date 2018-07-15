output "id" {
  description = "The ID of the ALB we created."
  value = "${aws_alb.main.id}"
}

output "alb_dns_name" {
  description = "The DNS name of the ALB presumably to be used with a friendlier CNAME."
  value = "${aws_alb.main.dns_name}"
}

output "target_group_arn" {
  description = "ARN of the target group. Useful for passing to your Auto Scaling group module."
  value = "${aws_alb_target_group.target_group.arn}"
}