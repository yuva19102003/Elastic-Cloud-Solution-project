#     Elastic-Cloud-Solution-project using Terraform

----

## tree structure
the terraform main configuration and module tree structure of this project [`terraform structure`](https://github.com/yuva19102003/Elastic-Cloud-Solution-project/blob/master/Terraform/terraform-structure.txt)

```bash
.
├── demo.png
├── main.tf
├── modules
│   ├── ec2
│   │   ├── asg
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variable.tf
│   │   ├── asg-attach
│   │   │   ├── main.tf
│   │   │   └── variable.tf
│   │   ├── template
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variable.tf
│   │   └── tg-alb
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variable.tf
│   ├── efs
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   └── vpc
│       ├── nat-gateway
│       │   ├── main.tf
│       │   ├── output.tf
│       │   └── variable.tf
│       ├── peering-connection
│       │   ├── main.tf
│       │   ├── output.tf
│       │   └── variable.tf
│       ├── rt
│       │   ├── route
│       │   │   ├── internet-gateway
│       │   │   │   ├── main.tf
│       │   │   │   └── variable.tf
│       │   │   ├── nat-gateway
│       │   │   │   ├── main.tf
│       │   │   │   └── variable.tf
│       │   │   └── peering-connection
│       │   │       ├── main.tf
│       │   │       └── variable.tf
│       │   ├── route-table
│       │   │   ├── main.tf
│       │   │   ├── output.tf
│       │   │   └── variable.tf
│       │   └── route-table-association
│       │       ├── main.tf
│       │       └── variable.tf
│       ├── security-group
│       │   ├── egress
│       │   │   ├── main.tf
│       │   │   └── variable.tf
│       │   ├── ingress
│       │   │   ├── main.tf
│       │   │   └── variable.tf
│       │   └── sg
│       │       ├── main.tf
│       │       ├── output.tf
│       │       └── variable.tf
│       └── vpc
│           ├── main.tf
│           ├── output.tf
│           └── variable.tf
├── output.tf
├── provider.tf
├── script
│   └── bash.sh
├── terraform-graph.png
├── terraform-plan.txt
├── terraform-structure.txt
├── terraform.tfstate
└── terraform.tfstate.backup

23 directories, 51 files

```

----
