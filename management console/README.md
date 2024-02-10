----

# Elastic-Cloud-Solution-project

## Elastic Cloud Solution: VPC Peering, EFS, Auto Scaling, SESSION Manager and Load Balancer for Resilient and Efficient Applications using aws management console

**Project Overview:**
- **Objective:** Establish a robust and scalable architecture across two Virtual Private Clouds (VPCs) on a cloud platform.
- **Key Components:**
  - VPC Peering Connection
  - Elastic File System (EFS)
  - Auto Scaling Group
  - Target Group
  - Application Load Balancer (ALB)

----

**Project Steps:**
1. **VPC Setup:**
    - Create VPCs: VPC-A (for EFS) and VPC-B (for Auto Scaling).
# Create VPCs: VPC-A (for EFS) and VPC-B (for Auto Scaling)

## Overview
This guide outlines the steps to create two Virtual Private Clouds (VPCs) - VPC-A and VPC-B, each serving specific purposes. VPC-A is designed to host Amazon Elastic File System (EFS), while VPC-B is intended for Auto Scaling applications.

## VPC-A (for EFS)
### Steps
1. **Create VPC**
   - Set up a new VPC with a unique CIDR block.
  
2. **Subnets**
   - Establish public and private subnets within VPC-A.
   - Allocate appropriate CIDR blocks to these subnets.

3. **Internet Gateway**
   - Attach an Internet Gateway to enable communication with the internet.

4. **Route Tables**
   - Configure route tables for both public and private subnets.
   - Associate the public subnet with the Internet Gateway.

5. **Security Groups**
   - Define security groups to control inbound and outbound traffic.
   - Allow necessary traffic for EFS.

## VPC-B (for Auto Scaling)
### Steps
1. **Create VPC**
   - Establish a new VPC with a distinct CIDR block.

2. **Subnets**
   - Create public and private subnets within VPC-B.
   - Allocate appropriate CIDR blocks to these subnets.

3. **Internet Gateway**
   - Attach an Internet Gateway to allow communication with the internet.

4. **Route Tables**
   - Configure route tables for public and private subnets.
   - Associate the public subnet with the Internet Gateway.

5. **Security Groups**
   - Define security groups to regulate inbound and outbound traffic.
   - Allow necessary traffic for Auto Scaling applications.


![assest](assest/1.png)
![assest](assest/2.png)
![assest](assest/3.png)
![assest](assest/4.png)

----

   - Configure VPC Peering Connection between VPC-A and VPC-B.
![assest](assest/5.png)
![assest](assest/6.png)
![assest](assest/7.png)

----
2. **EFS Configuration:**
   - Create an Elastic File System (EFS) in VPC-A.
 

![assest](assest/8.png)

- Set up security groups and network ACLs to allow communication with VPC-B.

![assest](assest/9.png)
![assest](assest/10.png)

![assest](assest/11.png)
![assest](assest/12.png)
![assest](assest/13.png)
![assest](assest/14.png)

----
3. **Auto Scaling Setup:**
   - Configure a launch configuration with necessary AMI and user data in VPC-B.
   - Create an Auto Scaling Group in the private subnet of VPC-B.
   - Use the VPC peering connection for cross-VPC communication
   
![assest](assest/15.png)

----
4. **Mounting EFS in Auto Scaling Instances:**
   - Update user data in the launch configuration to mount the EFS file system on Auto Scaling instances.
   
![assest](assest/16.png)
![assest](assest/17.png)
![assest](assest/18.png)
![assest](assest/19.png)

----
5. **Session manager:**
   - using the Session manager we can login to the private subnet ec2 without key pairs,inbound rules and ssh to it.
   
![assest](assest/20.png)
![assest](assest/21.png)
![assest](assest/22.png)

----
 **Load Balancing:**
   - Set up a Target Group in VPC-B.
   - Create an Application Load Balancer (ALB) in the public subnet of VPC-B.
   - Configure the ALB to use the Target Group.
   - 
![assest](assest/23.png)
![assest](assest/24.png)
![assest](assest/25.png)

----


7. **Testing and Monitoring:**
   - Validate the connectivity between EFS in VPC-A and Auto Scaling instances in VPC-B.
   - Monitor the performance and scaling behavior of the Auto Scaling Group.
   - Ensure the load balancer distributes traffic effectively among Auto Scaling instances.
   
![assest](assest/26.png)
![assest](assest/27.png)

----
8. **Documentation and Deployment Guide:**
   - Prepare comprehensive documentation detailing the architecture, configurations, and deployment steps.
   - Include troubleshooting guidelines and best practices.
     
![assest](assest/28.png)
![assest](assest/29.png)

----

**Conclusion:**
Successfully implementing this project will result in a resilient and scalable cloud architecture, utilizing VPC peering for secure communication, EFS for shared file storage, Auto Scaling for dynamic resource management, and an ALB for distributing incoming traffic across instances.

----

