## DevOps_at-_NIX
This repository contains the infrastructure and deployment code for hosting the browser-based video game Serpent Surge using DevOps best practices. The project is designed to automate the setup and deployment of the game on both local and cloud environments.

## Features .
Infrastructure as Code:

Uses Terraform to provision cloud resources, including:

RDS (MySQL): Managed database for scalable data storage.
EFS (Elastic File System): Shared persistent storage.
ECR (Elastic Container Registry): For storing Docker images.

Configuration Management:
Uses Ansible to automate:
Installation and configuration of Docker, MySQL, and Nginx on EC2 instances.
Deployment of the application.

Containerized Application:
Frontend: Built with lightweight nginx:alpine.
Backend: Built with lightweight node:alpine.
Managed via Docker Compose, using a bridge network to connect containers and the MySQL database on the host machine.
Automation:

Bash scripts for tasks such as MySQL backups and database management.


## Prerequisites.
 
Tools:

Ansible
Terraform
Docker & Docker Compose
AWS CLI configured with your credentials.

Environment:

AWS account with permissions to create EC2, RDS, EFS, and ECR resources.
A machine with SSH access and Ansible installed for deploying configurations.

## Contributors
Shalom Muyera - DevOps Engineer
Mate Torma - App developer.



