# elb
resource "aws_elb" "lb" {
  name                = "${var.app_name}-lb"
  internal            = false
  security_groups     = ["${aws_security_group.lb_sg.id}"]
  subnets             = ["${var.app_vpc_public_subnet_ids}"]
  instances           = ["${aws_instance.ec2.*.id}"]

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = 8900
    instance_protocol = "http"      
  }       
  listener {
    lb_port = 443
    lb_protocol = "http"
    instance_port = 8900
    instance_protocol = "http"        
  } 
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "tcp:8900"
    interval = 30
  }

  tags {
    Environment       = "Development"
  }
}
