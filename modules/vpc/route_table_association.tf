 # Assocate all the public subnets to Internet Access route table
resource "aws_route_table_association" "pub_to_igw_association" {
	subnet_id      = "${aws_subnet.subnet_public.*.id[count.index]}"
	route_table_id = "${aws_route_table.route_to_igw.id}"
#    count          = "${length(data.aws_availability_zones.available.names)}"
    count = "${length(data.aws_availability_zones.available.names)}"
}
 
# Associate all private subnets to Nat Gateway(s)
resource "aws_route_table_association" "pri_to_ngw_association" {
	subnet_id      = "${aws_subnet.subnet_private.*.id[count.index]}"
	# THE USE OF element IS NEEDED SO THAT aws_route_table.route_to_nat_gw.*.id WILL BE WRAPPED AROUND
	# TO MAKE IT WORKS ON BOTH CASES multi_az AND NOT.
	route_table_id = "${element(aws_route_table.route_to_nat_gw.*.id, count.index)}"
#	count          = "${length(data.aws_availability_zones.available.names)}"
	count = "${length(data.aws_availability_zones.available.names)}"
}