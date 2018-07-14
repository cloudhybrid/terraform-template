provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source = "git::ssh://git@github.com/opstree-terraform/vpc"
  cidr   = "${var.cidr}"
  name   = "${var.vpc_name}"
}

module "sandy_key_pair" {
  source          = "git::ssh://git@github.com/opstree-terraform/key_pair"
  public_key_path = "${var.pub_key_path}"
  name            = "${var.vpc_name}-key"
}

module "pub_subnet" {
  source                  = "git::ssh://git@github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.pub_sn_cidr}"
  az                      = "${var.aws_region}a"
  map_public_ip_on_launch = "true"
}

module "pvt_subnet" {
  source = "git::ssh://git@github.com/opstree-terraform/subnet"
  vpc_id = "${module.vpc.id}"
  cidr   = "${var.pvt_sn_cidr}"
  az     = "${var.aws_region}a"
}

module "nat" {
  source = "git::ssh://git@github.com/opstree-terraform/ec2"

  #source             = "../ec2"
  subnet_id          = "${module.pub_subnet.id}"
  aws_region         = "${var.aws_region}"
  name               = "${var.vpc_name}-nat"
  type               = "t2.micro"
  key_pair_id        = "${module.sandy_key_pair.id}"
  security_group_ids = "${module.vpc.default_sg_id}"
}

module "server" {
  source = "git::ssh://git@github.com/opstree-terraform/ec2"

  #source             = "../ec2"
  subnet_id          = "${module.pvt_subnet.id}"
  aws_region         = "${var.aws_region}"
  name               = "${var.vpc_name}-server1"
  type               = "t2.micro"
  key_pair_id        = "${module.sandy_key_pair.id}"
  security_group_ids = "${module.vpc.default_sg_id}"
}
