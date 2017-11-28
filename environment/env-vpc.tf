
module "vpc" {
	source                             = "../modules/vpc"
	vpc_name                           = "${var.vpc_name}"
  vpc_cdir                           = "${var.vpc_cdir}"

  vpc_bastion_ami                    = "${var.ami[var.region]}"
  vpc_bastion_instance_type          = "${var.ec2_instance_type}"
  vpc_bastion_key_name               = "${var.ec2_key_name}"

  vpc_myIP                           = "${var.myIP}"
}

##########################
# outputs from module vpc
##########################

output "region" {
  value = "${var.region}"
}

output "vpc-name" {
  value = "${module.vpc.vpc_name}"
}

output "vpc-id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_public_subnet_ids" {
  value = "${module.vpc.vpc_public_subnet_ids}"
}

output "vpc_public_subnet_cdirs" {
  value = "${module.vpc.vpc_public_subnet_cdirs}"
}

output "vpc_private_subnet_ids" {
  value = "${module.vpc.vpc_private_subnet_ids}"
}

output "vpc_private_subnet_cdirs" {
  value = "${module.vpc.vpc_private_subnet_cdirs}"
}

output "vpc_nat_gateway_eips" {
    value = "${module.vpc.vpc_nat_gateway_eips}"
}

output "vpc_nat_gateways" {
  value = "${module.vpc.vpc_nat_gateways}"
}