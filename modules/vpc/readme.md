This module provision a vpc with all the subnets, route tables, internet gateway, nat gateway(s), etc.
We will use data source to query the region for all availability zones, then dynamically build a public subnet, a private subnet for each zone.
We break apart the vpc cidr then assign the sub-cidr to each subnet.
If the choice is multi_az we create each nat gateway in each public subnet. We route each private subnet to the nat gateway in the same AZ. For none multi_az option we create only one nat gatewaye, and route all the private subnets to it. 
