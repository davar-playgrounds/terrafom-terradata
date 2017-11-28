
resource "aws_security_group" "bastion_myIP_sg" {
  name = "bastion_myIP_sg"
  description = "Allow ssh from myIP"
  vpc_id            = "${aws_vpc.vpc.id}" 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_myIP}"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "bastion_myIP_sg"
  }
}