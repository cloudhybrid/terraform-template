resource "aws_security_group_rule" "sg_rule" {
  type              = "${var.type}"
  to_port           = "${var.to_port}"
  from_port         = "${var.from_port}"
  protocol          = "${var.protocol}"
  source_security_group_id   = "${var.inbound_sg}"
  security_group_id = "${var.security_group_id}"
}
