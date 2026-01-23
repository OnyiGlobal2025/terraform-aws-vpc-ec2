# Project Overview

This project demonstrates the design, provisioning, validation, and lifecycle management of a complete AWS network and compute environment using Terraform (Infrastructure as Code).

The infrastructure was built in a modular, production-style manner, following best practices for networking, security, and resource separation.
All resources were successfully created, verified (including SSH access), and cleanly destroyed to avoid unnecessary cloud costs.

# Architecture Summary

The project provisions the following AWS resources:

Custom VPC

Public and private subnets across multiple Availability Zones

Internet Gateway (IGW) for public access

NAT Gateway for private subnet outbound access

Route tables and associations

Security Groups with least-privilege access

Public EC2 instance (Amazon Linux 2)

Secure SSH access restricted to the developer’s public IP

The infrastructure follows a real-world public/private network design commonly used in production environments.

# Project Structure
terraform-aws-vpc-ec2/
│
├── modules/
│   └── vpc/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── ec2/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── envs/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       ├── providers.tf
│       └── outputs.tf
│
├── .gitignore
└── README.md

⚙️ Key Terraform Concepts Demonstrated

Modular Terraform design (modules/vpc, ec2)

Variable scoping across root and child modules

Secure networking with public/private subnet separation

Controlled SSH access using CIDR restrictions

Dependency management between VPC and EC2

Terraform validation and planning before apply

Clean resource teardown using terraform destroy

Safe handling of Terraform state (not committed to Git)

🚀 Deployment Workflow

The project followed this intentional workflow:

Initialize Terraform

terraform init


Validate configuration

terraform validate


Review execution plan

terraform plan


Apply infrastructure

terraform apply


Verify deployment

Confirmed resources in AWS Console

Successfully SSH’d into the EC2 instance

Destroy infrastructure

terraform destroy


This ensured cost safety and demonstrated full lifecycle control.

🔐 Security Considerations

SSH access restricted to the developer’s public IP (/32)

Private subnets have no direct internet access

Outbound internet access for private subnets routed via NAT Gateway

Security Groups used instead of overly permissive network ACLs

# Design Decisions & Rationale
Why no remote backend (S3 / Terraform Cloud)?

This project was intentionally scoped as a single-engineer, ephemeral environment focused on Terraform fundamentals.

For production or team environments, a remote backend (S3 + DynamoDB or Terraform Cloud) would be used.
Those workflows are planned as separate, dedicated Terraform projects to keep learning objectives clear and focused.

Why no CI/CD in this project?

CI/CD pipelines for Terraform are best demonstrated in projects focused on automation, policy enforcement, and team workflows.
This project focuses on infrastructure design and correctness, not pipeline execution.

# Documentation & Evidence

The following were captured during the project (recommended for review):

terraform validate success output

terraform plan showing resources to be created

Successful terraform apply

EC2 public IP output

SSH session into the EC2 instance

Successful terraform destroy

# Cleanup

All AWS resources created by this project were successfully destroyed after verification to prevent ongoing charges.

# Future Enhancements

Planned follow-up projects include:

Terraform remote backend with S3 & DynamoDB

Terraform CI/CD with GitHub Actions

Terraform Cloud workspace-driven workflows

These will be implemented as separate portfolio projects.

# Author

[Onyedika Okoro]
Cloud / DevOps Engineer
Terraform • AWS • Infrastructure as Code