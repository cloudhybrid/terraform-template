resource "aws_security_group" "pub_ssh_sg" {
  name   = "pub_ssh_sg"
  vpc_id = "${var.vpc_id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr}"]
  }
}
