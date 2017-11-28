# Security group for bastions
resource "aws_security_group" "bastion_td_sg" {
  name = "bastion_td_sg"
  description = "Allow ssh from 141.206.246.10/32"
  vpc_id            = "${aws_vpc.vpc.id}" 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["141.206.246.10/32"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "bastion_td_sg"
  }

#  provisioner "local-exec" {
#    command = "echo  $(curl -s http://whatismyip.akamai.com/)/32 | tr -d '\n' > files/myIP"  
#  }
 
}
