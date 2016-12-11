# Terraform Tutorial

# Instance config
variable "region" { default = "us-west-2" } # Oregon
variable "ami" { default = "ami-a9d276c9" } # Ubuntu Server 16.04 LTS (HVM)
variable "instance_type" { default = "t2.micro" } # Free tier

# Keypair
variable "key_name" { default = "aws_access" } 

# aws.pem.pub
variable "public_key" { default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD24mNvDxMcgJNhGW56G6MQU2X6w9RfMfaRI+qU9aHSq2PipEcATYlmVjWw0CICPMpCjCm6EvjyNhY7++Ww7Xc1mDoJ8AlW4eKW5D6nw61rbZFKcci7XeHR9Y0Uc1YvU9NiAu518KrDldWs5mJoOeIXqLd61JXgzSyjZp1BqkNOrxTDDTu9x9pGMxEuCeB0H5dsb4FXCTlsPaq7/DGuWxGYwyMpE6Popu3vABhOrYlA/mY4gbAjf+DFqePE0igsvrvbsc1eZRjHYkecY31vqVcdRT+wXF1WNiEI6EigvbrJoddvkW700RjD+IYiojr+g/dNvk5HW2M/oErJvisP3RBn katesclau@LAPTOP-OKUO8ICU" } 
