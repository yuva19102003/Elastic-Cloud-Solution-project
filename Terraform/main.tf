


# main.tf for maintaing all resources

#--------------------------------------------------------------------------------------------------
# production.vpc

module "production" {

  source                    = "./modules/vpc/vpc"
  vpc-name                  = "production-vpc"
  vpc-cidr-block            = "10.0.0.0/16"
  subnet-az                 = ["us-east-1a", "us-east-1b"]
  private-subnet-cidr-block = ["10.0.1.0/24", "10.0.2.0/24"]
  public-subnet-cidr-block  = ["10.0.3.0/24", "10.0.4.0/24"]
}

#--------------------------------------------------------------------------------------------------
# creating NAT gateway

module "nat" {
  source               = "./modules/vpc/nat-gateway"
  nat-gw-public-subnet = module.production.public-subnet-id # use the public subnet id from the output.tf and assign to it
}
#--------------------------------------------------------------------------------------------------
# maintenance vpc

module "maintenance" {

  source                    = "./modules/vpc/vpc"
  vpc-name                  = "maintenance-vpc"
  vpc-cidr-block            = "172.31.0.0/16"
  subnet-az                 = ["us-east-1a"]
  private-subnet-cidr-block = ["172.31.128.0/20"]
  public-subnet-cidr-block  = ["172.31.0.0/20"]

}

#--------------------------------------------------------------------------------------------------
# vpc peering connection section

module "peering-vpc" {

  source           = "./modules/vpc/peering-connection"
  requester-vpc-id = module.production.vpc-id
  accepter-vpc-id  = module.maintenance.vpc-id

}


#--------------------------------------------------------------------------------------------------
# route table section
#--------------------------------------------------------------------------------------------------
# route-table-production-public-subnet-0

module "route-table-production-public-subnet-0" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.production.vpc-id

}
# internet gateway route
module "internet-gw-route-production-public-subnet-0" {
  source              = "./modules/vpc/rt/route/internet-gateway"
  route-table-id      = module.route-table-production-public-subnet-0.route-table-id
  internet-gateway-id = module.production.internet-gateway-id
}

# route table association 
module "rt-association-production-public-subnet-0" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.production.public-subnet-id[0]
  rt-association-route-table-id = module.route-table-production-public-subnet-0.route-table-id
}
#--------------------------------------------------------------------------------------------------
# route-table-production-public-subnet-1
/*
module "route-table-production-public-subnet-1" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.production.vpc-id

}

# internet gateway route
module "internet-gw-route-production-public-subnet-1" {
  source              = "./modules/vpc/rt/route/internet-gateway"
  route-table-id      = module.route-table-production-public-subnet-1.route-table-id
  internet-gateway-id = module.production.internet-gateway-id
}
*/
# route table association 
module "rt-association-production-public-subnet" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.production.public-subnet-id[1]
  rt-association-route-table-id = module.route-table-production-public-subnet-0.route-table-id
}
#--------------------------------------------------------------------------------------------------
# route-table-production-private-subnet-0

module "route-table-production-private-subnet-0" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.production.vpc-id

}
# nat gateway route
module "nat-gw-route-production-private-subnet-0" {
  source         = "./modules/vpc/rt/route/nat-gateway"
  route-table-id = module.route-table-production-private-subnet-0.route-table-id
  nat-gateway-id = module.nat.nat-gateway-id[0]

}

# vpc peering connections route

module "peering-route-production-private-subnet-0" {
  source                 = "./modules/vpc/rt/route/peering-connection"
  route-table-id         = module.route-table-production-private-subnet-0.route-table-id
  destination-cidr-block = "172.31.0.0/16"
  peering-connection-id  = module.peering-vpc.vpc-peering-connection-id

}


# route table association 
module "rt-association-production-private-subnet-0" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.production.private-subnet-id[0]
  rt-association-route-table-id = module.route-table-production-private-subnet-0.route-table-id
}
#--------------------------------------------------------------------------------------------------
# route-table-production-private-subnet-1

module "route-table-production-private-subnet-1" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.production.vpc-id

}

# nat gateway route
module "nat-gw-route-production-private-subnet-1" {
  source         = "./modules/vpc/rt/route/nat-gateway"
  route-table-id = module.route-table-production-private-subnet-1.route-table-id
  nat-gateway-id = module.nat.nat-gateway-id[1]

}

# vpc peering connections route

module "peering-route-production-private-subnet-1" {
  source                 = "./modules/vpc/rt/route/peering-connection"
  route-table-id         = module.route-table-production-private-subnet-1.route-table-id
  destination-cidr-block = "172.31.0.0/16"
  peering-connection-id  = module.peering-vpc.vpc-peering-connection-id

}

# route table association 
module "rt-association-production-private-subnet-1" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.production.private-subnet-id[1]
  rt-association-route-table-id = module.route-table-production-private-subnet-1.route-table-id
}

#--------------------------------------------------------------------------------------------------

# route-table-maintenance-public-subnet-0

module "route-table-maintenance-public-subnet-0" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.maintenance.vpc-id

}
# internet gateway route
module "internet-gw-route-maintenance-public-subnet-0" {
  source              = "./modules/vpc/rt/route/internet-gateway"
  route-table-id      = module.route-table-maintenance-public-subnet-0.route-table-id
  internet-gateway-id = module.maintenance.internet-gateway-id
}

# route table association 
module "rt-association-maintenance-public-subnet-0" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.maintenance.public-subnet-id[0]
  rt-association-route-table-id = module.route-table-maintenance-public-subnet-0.route-table-id
}
#--------------------------------------------------------------------------------------------------

# route-table-maintenance-private-subnet-1

module "route-table-maintenance-private-subnet-0" {
  source             = "./modules/vpc/rt/route-table"
  route-table-vpc-id = module.maintenance.vpc-id

}

# vpc peering connections route

module "peering-route-maintenance-private-subnet-0" {
  source                 = "./modules/vpc/rt/route/peering-connection"
  route-table-id         = module.route-table-maintenance-private-subnet-0.route-table-id
  destination-cidr-block = "10.0.0.0/16"
  peering-connection-id  = module.peering-vpc.vpc-peering-connection-id

}

# route table association 
module "rt-association-maintenance-private-subnet-0" {
  source                        = "./modules/vpc/rt/route-table-association"
  rt-association-subnet-id      = module.maintenance.private-subnet-id[0]
  rt-association-route-table-id = module.route-table-maintenance-private-subnet-0.route-table-id
}

#--------------------------------------------------------------------------------------------------

# security group for production vpc

module "production-security-group" {
  source              = "./modules/vpc/security-group/sg"
  security-group-name = "production-sg"
  sg-tag              = "production-sg"
  vpc-id              = module.production.vpc-id

}

# outbound rule
module "production-sg-outbound-all-traffic" {
  source            = "./modules/vpc/security-group/egress"
  security-group-id = module.production-security-group.security-group-id
  port              = -1
  protocol          = "-1"
}

# ingress rules

module "production-sg-inbound-ssh" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.production-security-group.security-group-id
  port              = 22
  protocol          = "tcp"
  cidr-blocks       = "0.0.0.0/0"
}

module "production-sg-inbound-http" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.production-security-group.security-group-id
  port              = 80
  protocol          = "tcp"
  cidr-blocks       = "0.0.0.0/0"
}

module "production-sg-inbound-https" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.production-security-group.security-group-id
  port              = 443
  protocol          = "tcp"
  cidr-blocks       = "0.0.0.0/0"
}

module "production-sg-inbound-peering" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.production-security-group.security-group-id
  port              = -1
  protocol          = "icmp"
  cidr-blocks       = "172.31.0.0/16"
}
#--------------------------------------------------------------------------------------------------

# security group for maintenance vpc

module "maintenance-security-group" {
  source              = "./modules/vpc/security-group/sg"
  security-group-name = "maintenance-sg"
  sg-tag              = "maintennace-sg"
  vpc-id              = module.maintenance.vpc-id

}

# outbound rules

module "maintenance-sg-outbound-all-traffic" {
  source            = "./modules/vpc/security-group/egress"
  security-group-id = module.maintenance-security-group.security-group-id
  port              = -1
  protocol          = "-1"
}

# ingress rules

module "maintenance-sg-inbound-ssh" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.maintainance-security-group.security-group-id
  port              = 22
  protocol          = "tcp"
  cidr-blocks       = "0.0.0.0/0"
}

module "maintenance-sg-inbound-nfs" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.maintnance-security-group.security-group-id
  port              = 2049
  protocol          = "tcp"
  cidr-blocks       = "0.0.0.0/0"
}

module "maintainance-sg-inbound-peering" {
  source            = "./modules/vpc/security-group/ingress"
  security-group-id = module.maintainance-security-group.security-group-id
  port              = -1
  protocol          = "icmp"
  cidr-blocks       = "10.0.0.0/16"
}
#--------------------------------------------------------------------------------------------------

# efs section

module "efs" {
  source          = "./modules/efs"
  subnet-id       = module.maintainance.private-subnet-id[0]
  security-groups = module.maintainance-security-group.security-group-id

}

resource "null_resource" "efs-config" {
  provisioner "local-exec" {
    command = <<-EOT
      # Your other commands before sed, if any
      cd script
      sed -i 's/IP-ADDRESS/${module.efs.efs-ip}/' bash.sh
      sed -i 's/DNS-NAME/${module.efs.efs-dns-name}/' bash.sh
      sed -i 's/EFS-ID/${module.efs.efs-id}/' bash.sh
      git add .
      git commit -m "${module.efs.efs-id}"
    EOT
  }
}

resource "null_resource" "efs-backup" {
  # this local exec after the terraform destroy
  provisioner "local-exec" {
    when       = destroy
    command    = <<-EOT
      # Your other commands before sed, if any
      cd script
      git reset a4306f178b9f971129343c8f4320e105198dc2f5
      git restore bash.sh
    EOT
    on_failure = continue
  }
}

#--------------------------------------------------------------------------------------------------

# launch template

module "template" {
  source           = "./modules/ec2/template"
  template-name    = "server-template"
  key-pairs        = "demo"
  instance-profile = "AmazonSSMRoleForInstancesQuickSetup"
  userdata         = "./script/bash.sh"
  template-sg      = module.production-security-group.security-group-id
}

#--------------------------------------------------------------------------------------------------

# autoscaling group

module "autoscaling" {
  source       = "./modules/ec2/asg"
  asg-name     = "server autoscaling"
  template-id  = module.template.launch-template-id
  min          = 2
  max          = 4
  desired-size = 2
  vpc-subnets  = module.production.private-subnet-id[*]
}
#--------------------------------------------------------------------------------------------------

# target group and application load balancer

module "tg-alb" {
  source = "./modules/ec2/tg-alb"

  # target group
  target-group-name = "server-target-group"
  vpc-id            = module.production.vpc-id

  # application load balancer
  alb-name      = "server-laod-balancer"
  alb-sg        = module.production-security-group.security-group-id
  alb-subnet-id = module.production.public-subnet-id[*]

  # applicatio laod balancer listener
  alb-listener-port     = 80
  alb-listener-protocol = "HTTP"

}

#--------------------------------------------------------------------------------------------------

# auto scaling and target group attachment


module "asg-tg-attachment" {
  source   = "./modules/ec2/asg-attach"
  asg-name = module.autoscaling.asg-id-name
  tg-arn   = module.tg-alb.target-group-arn
}

#--------------------------------------------------------------------------------------------------
