# define variables

###############################
# AWS region
###############################
variable "region" {
  description = "The AWS region."
}

###############################
#vpc info
###############################
variable "vpc_name" {
  type        = "string"
  description = "The nme of the VPC"
}

variable "vpc_cdir" {
  type        = "string"
  description = "The cdir of the VPC"
}

################################
#ec2
################################
variable "ec2_instance_type" {
  type        = "string"
  description = "The ec2 instance type"
}

variable "ec2_key_name" {
  type        = "string"
  description = "The ec2 instance key name"
}

################################
#ami
################################
variable "ami" {
  type        = "map"
  description = "A map of AMIs"
  default     = {}
}

################################
#user_data
################################
variable "user_data" {
  type        = "map"
  description = "A map of user_data based on application specific"
  default     = {}
}

################################
#app
################################
variable "app_name" {
  type        = "string"
  description = "The app's name"
}

variable "app_primay" {
  type        = "string"
  description = "The app's primary package name"
}

variable "app_secondary" {
  type        = "string"
  description = "The app's seconday package name"
}

variable "app_count" {
  type        = "string"
  description = "The number of ec2 instances used for the app"
}

variable "myIP" {
  type        = "string"
  description = "My public IP"
}
