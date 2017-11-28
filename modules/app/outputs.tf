output "app_name" {
	value = "${var.app_name}"
}

output "app_ec2_ids" {
  value = ["${aws_instance.ec2.*.id}"]
}

output "app_elb" {
  value = ["${aws_elb.lb.arn}"]
}