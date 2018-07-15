resource "aws_volume_attachment" "ebs_att" {
  device_name = "${var.device_name}"
  volume_id   = "${aws_ebs_volume.ebs_volume.id}"
  instance_id = "${var.aws_instance_id}"
  skip_destroy = true
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "${var.availability_zone}"
  size              = "${var.volume_size}"
  type              = "${var.volume_type}"
}
