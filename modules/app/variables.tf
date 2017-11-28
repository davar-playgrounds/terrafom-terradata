variable "app_region" {}
variable "app_vpc_id" {}
variable "app_vpc_public_subnet_ids" {
	type = "list"
}
variable "app_vpc_private_subnet_ids" {
	type = "list"
}
variable "app_vpc_bastion_private_ips" {
	type = "list"
}
variable "app_vpc_bastion_sg_id" {}
variable "app_name" {}
variable "app_primay" {}
variable "app_secondary" {}
variable "app_count" {}
variable "app_ami" {}
variable "app_ec2_instance_type" {}
variable "app_ec2_key_name" {}
