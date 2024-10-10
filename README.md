# Dockerized Web Application Deployment with Ansible

This project contains an Ansible playbook for deploying a dockerized web application using Nginx, PHP, and MySQL on a remote server.

## Infrastructure Setup with Terraform

This project includes Terraform scripts to create the necessary infrastructure on GCP for hosting the web application.

- The following resources are created:
  - **VPC Network**: A virtual private cloud (VPC) network for isolating resources.
  - **Subnetwork**: A subnetwork within the VPC for allocating IP addresses.
  - **Static IP Address**: A reserved static IP address for the instance.
  - **Compute Instance**: A virtual machine instance running Debian.
  - **Firewall Rules**: Rules to allow traffic on HTTP, HTTPS, and SSH ports.

## Project Structure

- **`app/`**: Contains the application files.
  - **`nginx/default.conf`**: Nginx configuration file.
  - **`php/Dockerfile`**: Dockerfile for PHP application.
  - **`php/index.php`**: Simple PHP info page.
  - **`db-load-script.sql`**: SQL script for initializing the database.
  - **`Docker-compose.yml`**: Docker Compose configuration file for the application.
  
- **`test_project/`**: Contains Ansible files.
  - **`inventory.yml`**: Ansible inventory file defining hosts.
  - **`playbook.yml`**: Ansible playbook for deploying the application.