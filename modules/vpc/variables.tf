variable "vpc_name" {
  type        = "string"
  description = "The nme of the VPC"
}

variable "vpc_cdir" {
  type        = "string"
  description = "The cdir of the VPC"
}

variable "vpc_bastion_ami" {}
variable "vpc_bastion_instance_type" {}
variable "vpc_bastion_key_name" {}

variable "vpc_myIP" {}