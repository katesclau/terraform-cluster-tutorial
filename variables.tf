# Terraform Tutorial

# Location and Network =====================================
variable "region" { default = "us-west-2" } # Oregon
variable "cluster_name" { default = "cluster-tut" }
variable "vpc_sg_ids" { default = "" }   
variable "sg_name" { default = "" } 
variable "availability_zone" { default = "us-west-2a" }

# ASG Pool and Launch Configuration=========================
variable "ami" { default = "ami-a9d276c9" } # Ubuntu Server 16.04 LTS (HVM)
variable "instance_type" { default = "t2.micro" } # Free tier

# Keypair ==================================================
variable "key_name" { default = "aws_access" } 

# aws.pem.pub
variable "public_key" { default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD24mNvDxMcgJNhGW56G6MQU2X6w9RfMfaRI+qU9aHSq2PipEcATYlmVjWw0CICPMpCjCm6EvjyNhY7++Ww7Xc1mDoJ8AlW4eKW5D6nw61rbZFKcci7XeHR9Y0Uc1YvU9NiAu518KrDldWs5mJoOeIXqLd61JXgzSyjZp1BqkNOrxTDDTu9x9pGMxEuCeB0H5dsb4FXCTlsPaq7/DGuWxGYwyMpE6Popu3vABhOrYlA/mY4gbAjf+DFqePE0igsvrvbsc1eZRjHYkecY31vqVcdRT+wXF1WNiEI6EigvbrJoddvkW700RjD+IYiojr+g/dNvk5HW2M/oErJvisP3RBn katesclau@LAPTOP-OKUO8ICU" } 

# Database =================================================

# Name
variable "rds_name" { default = "cluster-tut-mariadb" }

# Instance class
variable "db_instance_class" { default = "db.t2.micro" } # Free tier

# Storage
variable "db_storage" { default = 20 } # Free tier max
variable "db_storage_type" { default = "standard" } # Free tier

# DB Engine 
variable "db_engine" { default = "mariadb" }

# Database configuration
# user and password stored on database_credentials.tf
variable "db_name" { default = "base" }

# Load Balancer ============================================

# Name
variable "elb_name" { default = "cluster-tut-elb" }

