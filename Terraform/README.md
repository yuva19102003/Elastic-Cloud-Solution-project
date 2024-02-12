#     Elastic-Cloud-Solution-project using Terraform

## Elastic Cloud Solution: VPC Peering, EFS, Auto Scaling, SESSION Manager and Load Balancer for Resilient and Efficient Applications

----

![DIAGRAM](https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/ELASTIC-CLOUD-SOLUTION.drawio.svg)


**Project Overview:**
- **Objective:** Establish a robust and scalable architecture across two Virtual Private Clouds (VPCs) on a cloud platform using terraform IaC.
- **Key Components:**
  - VPC Peering Connection
  - Elastic File System (EFS)
  - Auto Scaling Group
  - Target Group
  - Application Load Balancer (ALB)

# Tree structure
- the whole tree structure of terraform main configuration and modules
[`terraform Tree structure`](https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-structure.txt)
- the terraform module tree structure of this project 

```bash
.
├── ec2
│   ├── asg
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── asg-attach
│   │   ├── main.tf
│   │   └── variable.tf
│   ├── template
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── tg-alb
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
├── efs
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
└── vpc
    ├── nat-gateway
    │   ├── main.tf
    │   ├── output.tf
    │   └── variable.tf
    ├── peering-connection
    │   ├── main.tf
    │   ├── output.tf
    │   └── variable.tf
    ├── rt
    │   ├── route
    │   │   ├── internet-gateway
    │   │   │   ├── main.tf
    │   │   │   └── variable.tf
    │   │   ├── nat-gateway
    │   │   │   ├── main.tf
    │   │   │   └── variable.tf
    │   │   └── peering-connection
    │   │       ├── main.tf
    │   │       └── variable.tf
    │   ├── route-table
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variable.tf
    │   └── route-table-association
    │       ├── main.tf
    │       └── variable.tf
    ├── security-group
    │   ├── egress
    │   │   ├── main.tf
    │   │   └── variable.tf
    │   ├── ingress
    │   │   ├── main.tf
    │   │   └── variable.tf
    │   └── sg
    │       ├── main.tf
    │       ├── output.tf
    │       └── variable.tf
    └── vpc
        ├── main.tf
        ├── output.tf
        └── variable.tf
```
---
# Graph structure

the graph sturcture of the whole terraform main configuration and the modules. 
[`terraform graph structure`](https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-graph.png)
```bash
terraform graph |dot -Tpng > terraform-graph.png
```
<img src="https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-graph.png">

---

# modules
In this project, the modules were created by own.
the module is classified into three catagories.
- VPC
- EFS
- EC2

---

# Terraform VPC Module

This Terraform module streamlines the creation of a Virtual Private Cloud (VPC) along with essential components like Security Groups, NAT Gateways, VPC Peering, and Route Tables on your chosen cloud platform.
```bash
.
├── nat-gateway
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
├── peering-connection
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
├── rt
│   ├── route
│   │   ├── internet-gateway
│   │   │   ├── main.tf
│   │   │   └── variable.tf
│   │   ├── nat-gateway
│   │   │   ├── main.tf
│   │   │   └── variable.tf
│   │   └── peering-connection
│   │       ├── main.tf
│   │       └── variable.tf
│   ├── route-table
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── route-table-association
│       ├── main.tf
│       └── variable.tf
├── security-group
│   ├── egress
│   │   ├── main.tf
│   │   └── variable.tf
│   ├── ingress
│   │   ├── main.tf
│   │   └── variable.tf
│   └── sg
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
└── vpc
    ├── main.tf
    ├── output.tf
    └── variable.tf

14 directories, 27 files
```
## Features

- **VPC Creation:** Easily deploy a flexible VPC with customizable IP ranges and subnets.

- **Security Groups:** Manage inbound and outbound traffic rules for instances within the VPC.

- **NAT Gateways:** Securely enable private subnet instances to access the internet through Network Address Translation (NAT) gateways.

- **VPC Peering:** Establish connections between different VPCs for seamless communication.

- **Route Tables:** Control traffic routing within the VPC, ensuring efficient network communication.

---

# Terraform EFS Module

This Terraform module simplifies the configuration and deployment of Amazon Elastic File System (EFS) on your cloud platform.
```bash
.
├── main.tf
├── output.tf
└── variable.tf

0 directories, 3 files
```

## Features

- EFS Creation: Effortlessly set up and configure Amazon EFS to provide scalable and elastic file storage for your applications.

- Mount Targets: Define and manage mount targets to securely access the EFS file system from your Amazon Virtual Private Cloud (VPC).

- Security Groups: Customize security group rules to control network traffic to and from the EFS file system.

- Performance Optimization: Fine-tune performance settings based on your application's requirements and usage patterns.

- Backup and Recovery: Implement backup and recovery strategies to ensure data durability and availability.

---

# Terraform EC2 Auto Scaling Module

This Terraform module simplifies the deployment of scalable and resilient infrastructure using Amazon EC2 instances, Auto Scaling Groups, Target Groups, and Application Load Balancers.

```bash
.
├── asg
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
├── asg-attach
│   ├── main.tf
│   └── variable.tf
├── template
│   ├── main.tf
│   ├── output.tf
│   └── variable.tf
└── tg-alb
    ├── main.tf
    ├── output.tf
    └── variable.tf

4 directories, 11 files
```

## Features

- **Launch Configuration:** Configure the launch specifications for Amazon EC2 instances within the Auto Scaling Group.

- **Auto Scaling Group:** Set up Auto Scaling Groups for automatic adjustment of the number of EC2 instances based on demand or schedule.

- **Target Groups:** Define Target Groups for routing traffic to EC2 instances within the Auto Scaling Group.

- **Application Load Balancer:** Create an Application Load Balancer for evenly distributing incoming traffic across instances in the Target Group.

- **High Availability:** Ensure high availability and fault tolerance by distributing instances across multiple Availability Zones.

---

# Terraform Infrastructure Setup

This Terraform configuration facilitates the deployment of a resilient and scalable cloud infrastructure using three specialized modules:

## 1. VPC Module

**Features:**
- **VPC Configuration:** Establish a customizable Virtual Private Cloud (VPC) with specified IP ranges and subnets.
- **Security Groups:** Define and manage rules for inbound and outbound traffic within the VPC.
- **NAT Gateways:** Enable secure internet access for instances in private subnets.
- **VPC Peering:** Establish connections between different VPCs for seamless communication.
- **Route Tables:** Control traffic routing within the VPC for efficient network communication.

## 2. EFS Module

**Features:**
- **EFS Creation:** Set up Amazon Elastic File System (EFS) for scalable and elastic file storage.
- **Mount Targets:** Configure mount targets to access EFS securely from the Virtual Private Cloud (VPC).
- **Security Groups:** Customize security group rules for controlling network traffic.
- **Performance Optimization:** Fine-tune performance settings based on application requirements.
- **Backup and Recovery:** Implement strategies for data durability and availability.

## 3. EC2 Auto Scaling Module

**Features:**
- **Launch Configuration:** Configure specifications for Amazon EC2 instances within the Auto Scaling Group.
- **Auto Scaling Group:** Dynamically adjust the number of EC2 instances based on demand or schedule.
- **Target Groups:** Define routing for traffic to EC2 instances within the Auto Scaling Group.
- **Application Load Balancer:** Distribute incoming traffic evenly across instances with a load balancer.
- **High Availability:** Distribute instances across multiple Availability Zones for fault tolerance.

Customize these modules to meet your specific infrastructure requirements. Feel free to contribute or report issues!

---

# Conclusion

This Terraform Infrastructure Setup empowers you to effortlessly deploy and manage a robust cloud infrastructure tailored to your needs. The modular approach allows for flexibility and scalability, ensuring a seamless integration of essential components like Virtual Private Clouds (VPCs), Elastic File Systems (EFS), and Auto Scaling Groups with Application Load Balancers.

By utilizing these modules, you can:

- **Establish a Secure Network:** The VPC module provides a foundation for secure communication, allowing you to define security groups, set up NAT gateways, and enable VPC peering for comprehensive control over network traffic.

- **Efficient File Storage:** The EFS module simplifies the configuration of scalable and elastic file storage, ensuring optimal performance, security, and backup/recovery capabilities.

- **Scalable Application Infrastructure:** With the EC2 Auto Scaling module, effortlessly deploy and manage Amazon EC2 instances, Auto Scaling Groups, and Application Load Balancers, achieving high availability and scalability for your applications.

Feel free to tailor and expand upon these modules to meet your specific infrastructure requirements. The modular design encourages collaboration and adaptation, making it easier to evolve with changing business needs. Whether you're a beginner or an experienced practitioner, these modules provide a solid foundation for building resilient and scalable cloud environments.

Happy Terraforming!

----
