## DevOps_at-_NIX
This repository contains the infrastructure and deployment code for hosting the browser-based video game Serpent Surge using DevOps best practices. The project is designed to automate the setup and deployment of the game on both local and cloud environments.

## Project structure.
.
├── ansible               # Configuration management with Ansible
│   ├── ansible.cfg       # Ansible configuration file
│   ├── hosts             # List of target servers
│   ├── inventory         # Ansible inventory files
│   │   └── inventory.yml # Inventory of managed nodes (e.g., EC2 instances)
│   ├── playbook          # Main playbook for server setup
│   │   └── server_setup.yml
│   └── roles             # Ansible roles for modular configurations
│       ├── bash          # Role for Bash configurations
│       ├── docker        # Role for Docker setup
│       │   ├── handlers
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── mysql         # Role for MySQL configuration
│       └── nginx         # Role for Nginx reverse proxy
├── application           # Frontend and backend code for the application
│   ├── backend           # Backend service
│   │   ├── Dockerfile    # Dockerfile for backend container
│   │   ├── index.js      # Main backend code
│   │   └── package.json  # Dependencies for backend
│   ├── frontend          # Frontend service
│   │   ├── Dockerfile    # Dockerfile for frontend container
│   │   ├── index.html    # Main HTML file
│   │   ├── style.css     # Frontend styling
│   │   ├── game.js       # Game logic
│   │   ├── img           # Static assets
│   └── README.md         # Information about the application
├── bash                  # Bash scripts for server-side tasks
│   ├── mysql-backup.sh   # Script for MySQL backups
│   └── mysql-manager.sh  # Script for managing MySQL
├── docker-compose.yml    # Docker Compose configuration
├── etc                   # Miscellaneous configuration files
├── terraform             # Infrastructure as code with Terraform
│   ├── main.tf           # Main configuration file for Terraform
│   ├── variables.tf      # Variables for Terraform configurations
├── README.md             # Main README for the project

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

 Prerequisites.
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



