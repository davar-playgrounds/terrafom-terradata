resource "aws_instance" "bastion" {
  ami			              = "${var.vpc_bastion_ami}"
  instance_type	        = "${var.vpc_bastion_instance_type}"
  key_name		          = "${var.vpc_bastion_key_name}"
  subnet_id             = "${aws_subnet.subnet_public.*.id[count.index]}"
  security_groups       = ["${aws_security_group.bastion_td_sg.id}", "${aws_security_group.bastion_myIP_sg.id}"]
  security_groups       = ["${aws_security_group.bastion_td_sg.id}"]
  source_dest_check     = "false"
  tags {
    Name                = "${var.vpc_name}-bastion-${count.index}" 
  }
  count                 = "${length(data.aws_availability_zones.available.names)}"
}

resource "aws_eip" "bastion_eip" {
  vpc                   = true
  count                 = "${length(data.aws_availability_zones.available.names)}"
}

# associate eip -> bastion
resource "aws_eip_association" "eip_bastion" {
  instance_id           = "${aws_instance.bastion.*.id[count.index]}"
  allocation_id         = "${aws_eip.bastion_eip.*.id[count.index]}"

  count                 = "${length(data.aws_availability_zones.available.names)}"
}
