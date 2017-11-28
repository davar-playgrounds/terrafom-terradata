#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: terraform_wrapper.sh plan|apply"
    exit 1
fi

ACTION=$1

myIP="$(curl -s http://whatismyip.akamai.com/)/32"

terraform ${ACTION} \
   -var 'region=us-west-2' \
   -var 'vpc_name=terradata' \
   -var 'vpc_cdir=10.190.0.0/16' \
   -var 'ec2_instance_type=t2.micro' \
   -var 'ec2_key_name=thuy-rsa' \
   -var 'app_name=terradata-app' \
   -var 'app_primay=nginx' \
   -var 'app_secondary=apache2' \
   -var 'app_count=3' \
   -var "myIP=${myIP}"