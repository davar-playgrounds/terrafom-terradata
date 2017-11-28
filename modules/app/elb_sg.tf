
# Security group for Load Balancer
resource "aws_security_group" "lb_sg" {
  name = "${var.app_name}-lb_sg"
  description = "lb: Allow traffic from internet"
  vpc_id = "${var.app_vpc_id}"
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}-lb_sg"
  } 
}
