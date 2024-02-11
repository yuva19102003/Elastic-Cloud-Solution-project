


# this output.tf will display the information

#--------------------------------------------------------------------------------------------------
# production vpc detials



output "production-vpc" {
  value = module.production.vpc-id
}
output "production-public-subnet-id" {
  value = module.production.public-subnet-id
}
output "production-private-subnet-id" {
  value = module.production.private-subnet-id
}
output "production-igw-id" {
  value = module.production.internet-gateway-id
}
#--------------------------------------------------------------------------------------------------
# nat gateway id


output "nat-gw-id" {
  value = module.nat.nat-gateway-id
}

#--------------------------------------------------------------------------------------------------

# maintenance vpc


output "maintenance-vpc" {
  value = module.maintenance.vpc-id
}
output "maintenance-public-subnet-id" {
  value = module.maintenance.public-subnet-id
}
output "maintenance-private-subnet-id" {
  value = module.maintenance.private-subnet-id
}
output "maintenance-igw-id" {
  value = module.maintenance.internet-gateway-id
}

#--------------------------------------------------------------------------------------------------
#  vpc peering connection 

output "vpc-peering-connection-id" {
  value = module.peering-vpc.vpc-peering-connection-id

}
#--------------------------------------------------------------------------------------------------

# route table 
#production-public-subnet-0
output "route-table-production-public-subnet-0-id" {
  value = module.route-table-production-public-subnet-0.route-table-id

}
#--------------------------------------------------------------------------------------------------
/*
# route table 
# production-public-subnet-1

output "route-table-production-public-subnet-1-id" {
  value = module.route-table-production-public-subnet-1.route-table-id

}
*/
#--------------------------------------------------------------------------------------------------

# route table 
# production-private-subnet-0

output "route-table-production-private-subnet-0-id" {
  value = module.route-table-production-private-subnet-0.route-table-id

}
#--------------------------------------------------------------------------------------------------

# route table 
# production-private-subnet-1

output "route-table-production-private-subnet-1-id" {
  value = module.route-table-production-private-subnet-1.route-table-id

}

#--------------------------------------------------------------------------------------------------

# route table
# maintenance-private-subnet-0
output "route-table-maintenance-private-subnet-0-route-table-id" {
  value = module.route-table-maintenance-private-subnet-0.route-table-id

}
#--------------------------------------------------------------------------------------------------
# route table
# maintenance-public-subnet-0

output "route-table-maintenance-public-subnet-0-route-table-id" {
  value = module.route-table-maintenance-public-subnet-0.route-table-id

}
#--------------------------------------------------------------------------------------------------

# production security group

output "production-sg-id" {
  value = module.production-security-group.security-group-id
}


#--------------------------------------------------------------------------------------------------

# maintenance security group 

output "maintenance-sg-id" {
  value = module.maintenance-security-group.security-group-id
}

#--------------------------------------------------------------------------------------------------

# launch template id

output "template-id" {
  value = module.template.launch-template-id
}

#--------------------------------------------------------------------------------------------------

# autoscaling id

output "asg-id" {
  value = module.autoscaling.asg-id
}

output "asg-name" {
  value = module.autoscaling.asg-id-name
}

output "asg-arn" {
  value = module.autoscaling.asg-id-arn
}

#--------------------------------------------------------------------------------------------------

# target group

output "tg-id" {
  value = module.tg-alb.target-group-id
}

output "tg-arn" {
  value = module.tg-alb.target-group-arn
}

# load balancer dns name
output "alb-dns-name" {
  value = module.tg-alb.alb-dns-name

}
#--------------------------------------------------------------------------------------------------

