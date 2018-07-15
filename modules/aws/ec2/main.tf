resource "aws_instance" "instance" {
  ami                    = "${var.ami_id}"
  count                  = "${var.number_of_instances}"
  subnet_id              = "${var.subnet_id}"
  instance_type          = "${var.type}"
  key_name               = "${var.key_pair_id}"
  iam_instance_profile   = "${var.iam_instance_profile}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  user_data              = "${var.user_data}"

  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = "true"
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

resource "aws_route53_record" "route53_record" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.instance.private_ip}"]
}
