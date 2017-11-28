# Routing tables

# create route table for Internet Access via Internet Gateway - used by public subnets
resource "aws_route_table" "route_to_igw" {
	vpc_id = "${aws_vpc.vpc.id}" 
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.vpc-igw.id}"
	}
	tags {
        Name = "route-to-internet-via-igw"
    }
}

# create route table for Internet Access via Nat Gateway - used by private subnets
# for multi_az route each private subnet to the nat gateway in the same az
# for none multi_az route all private subnet to the same nat gateway.
resource "aws_route_table" "route_to_nat_gw" {
	vpc_id = "${aws_vpc.vpc.id}" 
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.nat_gateway.*.id[count.index]}"
	}
	tags {
        Name = "route-to-internet-via-nat-gw"
    }
    count = "${length(data.aws_availability_zones.available.names)}"
}
