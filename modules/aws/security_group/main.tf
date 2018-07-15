resource "aws_security_group" "sg" {
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

 tags {
    Name = "${var.name}"
  }

  tags {
    env = "${var.env}"
  }

  tags {
    project = "${var.project}"
  }

  tags {
    purpose = "${var.purpose}"
  }

  tags {
    nightowl = "${var.nightowl}"
  }

  tags {
    managedby = "${var.managedby}"
  }
}
