# Internet Gateway
resource "aws_internet_gateway" "vpc-igw" {
	vpc_id = "${aws_vpc.vpc.id}"
}