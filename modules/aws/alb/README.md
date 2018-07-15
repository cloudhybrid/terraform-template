# Aws ALB
A Terraform module that launches an ALB.

## Usage
```
module "alb" {
  source                        = "git::ssh://git@github.com/opstree-terraform/alb"
  alb_name                      = "test-alb"
  alb_protocols                 = ["HTTPS"]
  alb_security_groups           = ["", ""]
  certificate_arn               = "arn:aws:iam::123456789012:server-certificate"
  health_check_path             = "/login"
  subnets                       = ["", ""]
  tags                          = "${map("Environment", "test")}"
  vpc_id                        = ""
}
```
## Variables
| Variables              | Description |
|------------------------|-------------|
| alb_is_internal        | Boolean determining if the ALB is internal or externally facing.|
| alb_name               | The name of the ALB as will show in the AWS EC2 ELB console.|
| alb_security_groups    | The security groups with which we associate the ALB.|
| subnets                | A list of subnets to associate with the ALB.|
| backend_port           | The port the service on the EC2 instances listen on.|
| backend_protocol       | The protocol the backend service speaks.|
| vpc_id                 | VPC id where the ALB and other resources will be deployed.|
| tags                   | A map of tags to add to all resources.|
| health_check_interval  | Interval in seconds on which the health check against backend hosts is tried.|
| health_check_path      | The URL the ELB should use for health checks.|
| health_check_port      | The port used by the health check if different from the traffic-port.|
| health_check_timeout   | Seconds to leave a health check waiting before terminating it and calling the check unhealthy.|
| health_check_matcher   | The HTTP codes that are a success when checking TG health.|
| target_type            | The type of target that you must specify when registering targets with this target group.|
| certificate_arn        | The ARN of the SSL Certificate|
| security_policy        | The security policy if using HTTPS externally on the ALB.|

## Output
| Output            | Description |
|-------------------|-------------|
| id                | The ID of the ALB we created.|
| alb_dns_name      | The DNS name of the ALB presumably to be used with a friendlier CNAME.|
| target_group_arn  | ARN of the target group. Useful for passing to your Auto Scaling group module.|
