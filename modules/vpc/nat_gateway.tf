#
# Nat Gateway:
#    multi_az:
#       false:      create a single nat gateway on the first(index=0) public subnet 
#       true:       create each nat gateway on each public subnet. later we route each private subnet to the nat gateway in the same az.
#

resource "aws_eip" "nat_gateway_eip" {
  vpc            = true
  count          = "${length(data.aws_availability_zones.available.names)}"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id  = "${aws_eip.nat_gateway_eip.*.id[count.index]}"
  subnet_id      = "${aws_subnet.subnet_public.*.id[count.index]}"

#  tags {
#    Name         = "$natgw-${count.index}" 
#  }

  count          = "${length(data.aws_availability_zones.available.names)}"
} 