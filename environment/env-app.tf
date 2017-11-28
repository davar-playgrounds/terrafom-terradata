# The app

module "app" {
	source                         = "../modules/app"

  app_region                     = "${var.region}"
  app_vpc_id                     = "${module.vpc.vpc_id}"
  app_vpc_public_subnet_ids      = "${module.vpc.vpc_public_subnet_ids}"
  app_vpc_private_subnet_ids     = "${module.vpc.vpc_private_subnet_ids}"
  app_vpc_bastion_private_ips    = "${module.vpc.vpc_bastion_private_ips}"
  app_vpc_bastion_sg_id          = "${module.vpc.vpc_bastion_sg_id}"

	app_name                       = "${var.app_name}"
  app_primay                     = "${var.app_primay}"
  app_secondary                  = "${var.app_secondary}"
  app_count                      = "${var.app_count}"

  app_ami                        = "${var.ami[var.region]}"
  app_ec2_instance_type          = "${var.ec2_instance_type}"
  app_ec2_key_name               = "${var.ec2_key_name}"
}

##########################
# outputs from module app
##########################

output "app_name" {
  value = "${module.app.app_name}"
}

output "app_ec2_ids" {
  value = ["${module.app.app_ec2_ids}"]
}

output "app_elb" {
  value = ["${module.app.app_elb}"]
}