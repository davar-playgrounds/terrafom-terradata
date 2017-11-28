1)	Install teraform from hashicorp:
	verify the installation by running this command:

	terraform version

	Terraform v0.11.0
	+ provider.aws v1.2.0
	+ provider.template v1.0.0

2)	Set up credentials:
	We need to use the access keys of the user who has permission to provision necessary AWS resources.

	export AWS_ACCESS_KEY_ID=xxxxxxxxxxx
	export AWS_SECRET_ACCESS_KEY=yyyyyyyyyyyyyyyyyyyyyyyy

3) Set up the project, and its modules:
	To set up this project go to the folder terradata/environment then run:
	
	terraform init
	terraform get

4) Run terraform to provision the AWS resource:
	a) to dry run and see what would happen

	terraform plan

	b) to provision the AWS resources
	terraform apply

5) Passing parameters to terraform
   All the parameters are declared in the file terradata/environment/variaables.tf. 
   The default values are set in the file terradata/environment/terraform.tfvars. 

   We can override the default argument in the command line:

   terraform plan \
   -var 'region=us-west-2' \
   -var 'vpc_name=terradata' \
   -var 'vpc_cdir=10.190.0.0/16' \
   -var 'ec2_instance_type=t2.micro' \
   -var 'ec2_key_name=thuy-rsa' \
   -var 'app_name=terradata-app' \
   -var 'app_primay=apache2' \
   -var 'app_secondary=nginx' \
   -var 'app_count=3'
 
 6) Normally during a terraform run we can use local provisioner to obtain our public IP 
 and use it as CDIR in a security group for the bastion hosts. 
 Due to a bug in some versions of terraform, https://github.com/hashicorp/terraform/issues/13034, 
 we use a wrapper to get our outgoing  laptop public IP and pass it on to terraform.
 In future releases we may not need to do that.
 
 7) If you have any issue runninng this code please do not hesitate to contact me:
 thuyqnguyen@yahoo.com, or (661)-406-4244