resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${var.pub_sn_id}"
}

resource "aws_route_table" "pvt_route_table" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }

  tags {
    Name = "${var.vpc_name}-pvt-rtb"
  }
}

resource "aws_route_table_association" "rtb_association" {
  subnet_id      = "${var.pvt_sn_id}"
  route_table_id = "${aws_route_table.pvt_route_table.id}"
}
