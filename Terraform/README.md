#     Elastic-Cloud-Solution-project using Terraform

----

## Tree structure
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
## Graph structure

the graph sturcture of the whole terraform main configuration and the modules. 
[`terraform graph structure`](https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-graph.png)
```bash
terraform graph |dot -Tpng > terraform-graph.png
```
<img src="https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-graph.png">

----
