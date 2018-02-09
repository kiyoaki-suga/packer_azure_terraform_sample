# Overview
Packer と Ansible で Terraform と Azure CLI 2.0 入り VM の Golden Image （管理ディスク）を作ります

# Preparation
* Provisoner に ansible_local を使います。
* Prepare your Resource Group & Storage Account to store your image
* Make "builder/variables.json" file to describe your credentials & identifiers
    * "variables.sample.json" is for your reference
* Make "builder/packer.json" file to describe your packer configuration
    * "centos.json" is for your reference
* Modify a playbook "ansible/roles/baseimage/tasks/main.yml" as you like
    * This sample install terraform and Azure CLI 2.0
    * Sample Terraform Module Directry Tree  
　　．  
　　┗ modules  
　　　　┣ computegroup  
　　　　┃　┣ main.tf  
　　　　┃　┣ os  
　　　　┃　┃　┣ outputs.tf  
　　　　┃　┃　┗ variables.tf  
　　　　┃　┣ outputs.tf  
　　　　┃　┗ variables.tf  
　　　　┣ database  
　　　　┃　┣ azure_database_postgresql.tf  
　　　　┃　┣ output.tf  
　　　　┃　┗ variables.tf  
　　　　┣ loadbalancer  
　　　　┃　┣ application_gateway.tf  
　　　　┃　┣ output.tf     
　　　　┃　┗ variables.tf      
　　　　┗ network  
　　　　　　┣ application_gateway.tf  
　　　　　　┣ output.tf  
　　　　　　┗ variables.tf  

# How to make your image
1. cd builder
2. packer build -var-file=variables.json packer.json
