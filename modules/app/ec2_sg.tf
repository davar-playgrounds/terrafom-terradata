
# Security group for ec2 Instances: allow access from elb
resource "aws_security_group" "ec2_elb_sg" {
  name = "${var.app_name}-ec2_elb_sg"
  description = "Allow traffic from elb"
  vpc_id = "${var.app_vpc_id}"
  ingress {
    from_port = 8900
    to_port = 8900
    protocol = "tcp"
    security_groups = ["${aws_security_group.lb_sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}-ec2_elb_sg"
  } 
}

# Security group for ec2 Instances: allow access from bastions
resource "aws_security_group" "ec2_bastion_sg" {
  name = "${var.app_name}-ec2_bastion_sg"
  description = "Allow traffic from bastion"
  vpc_id = "${var.app_vpc_id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
  #  cidr_blocks = ["${var.app_vpc_bastion_private_ips}"]
    security_groups = ["${var.app_vpc_bastion_sg_id}"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}-ec2_bastion_sg"
  } 
}

