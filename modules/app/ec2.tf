locals {
  apps = ["${var.app_primay}", "${var.app_secondary}"]
}

data "template_file" "bootstrap_server" {
  template = "${file("files/bootstrap_${count.index == 0 ? local.apps[0] :local.apps[1]}.sh")}"

  vars {
    CUSTOM_PORT = "8900"
  }

  count = 2
}

resource "aws_instance" "ec2" {
  ami			              = "${var.app_ami}"
  instance_type	        = "${var.app_ec2_instance_type}"
  key_name		          = "${var.app_ec2_key_name}"
  #subnet_id             = "${var.app_vpc_private_subnet_ids[count.index]}"
  subnet_id             = "${element(var.app_vpc_private_subnet_ids, count.index)}"
  security_groups       = ["${aws_security_group.ec2_elb_sg.id}", "${aws_security_group.ec2_bastion_sg.id}"]

  user_data             = "${count.index == var.app_count - 1 ? data.template_file.bootstrap_server.1.rendered : data.template_file.bootstrap_server.0.rendered}"
  
  count                 = "${var.app_count}"

  tags {
    Name 		            = "${var.app_name}-${count.index == var.app_count - 1 ? local.apps[1] : local.apps[0]}-${count.index}" 
  }
}
