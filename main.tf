provider "aws" {
  region  = "us-east-1"
}
variable "decision" {
  description = "do you will permit the peering? true or false"
}

variable "peer_owner_id" {
    description = "please add ownerid:"
}

resource "aws_vpc_peering_connection" "foo" {
  peer_owner_id = "${var.peer_owner_id}"
  peer_vpc_id   = "${aws_vpc.bar.id}"
  vpc_id        = "${aws_vpc.foo.id}"
  auto_accept   = "${var.decision}"

  tags = {
    Name = "VPC Peering between foo and bar"
  }
}

resource "aws_vpc" "foo" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc" "bar" {
  cidr_block = "10.2.0.0/16"
}
