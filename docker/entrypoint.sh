#!/bin/bash

# Initialize and apply Terraform
cd terraform
terraform init
terraform apply -auto-approve

# Get the public IP output from Terraform
INSTANCE_IP=$(terraform output -raw instance_ip)

# Update Ansible inventory
sed -i "s/{{ your_instance_ip_here }}/$INSTANCE_IP/g" ../ansible/inventory

# Run Ansible playbook
cd ../ansible
ansible-playbook playbook.yml
