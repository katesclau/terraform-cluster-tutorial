# Terraform Tutorial

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

module "servers" {
  source = "./ec2"

  region = "${var.region}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  # From keys module
  key_pair_name = "${module.keys.key_name}"
}

module "keys" {
  source = "./keys"

  key_pair_name = "${var.key_name}"
  public_key = "${var.public_key}"
}


