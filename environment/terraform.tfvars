region = "us-west-2"

################################
#vpc
################################
vpc_name                 = "terradata"
vpc_cdir                 = "10.190.0.0/16"

################################
#ec2
################################
ec2_instance_type        = "t2.micro"
ec2_key_name             = "thuy-rsa"

################################
#ami
################################
ami {
    us-west-1            = "ami-3e21725e"
    us-west-2            = "ami-5e63d13e"
    us-east-1            = "ami-7dce6507"
}

################################
#app
################################
app_name                 = "terradata-app"
app_primay               = "apache2"
app_secondary            = "nginx"
app_count                = "3"

myIP                     = "127.0.0.1/32"
