# Terraform Cluster Tutorial

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

module "cluster" {
  source = "./ec2"

  region = "${var.region}"
  availability_zone = "${var.availability_zone}"

  cluster_name = "${var.cluster_name}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  # From keys module
  key_pair_name = "${module.keys.key_name}"

  # From load balancer module
  load_balancer = "${module.load_balancer.elb_name}"
}

module "keys" {
  source = "./keys"

  key_pair_name = "${var.key_name}"
  public_key = "${var.public_key}"
}

# MySQL
module "database" {
  source = "./rds"
 
  sg_name = "${var.sg_name}"
  vpc_sg_ids = "${var.vpc_sg_ids}"
  
  rds_name = "${var.rds_name}" 

  db_instance_class = "${var.db_instance_class}"

  db_storage = "${var.db_storage}"
  db_storage_type = "${var.db_storage_type}"

  db_engine = "${var.db_engine}"

  db_name = "${var.db_name}"
  db_user = "${var.db_user}"
  db_password = "${var.db_password}"
}

# Load Balancer
module "load_balancer" {
  source = "./elb"
 
  availability_zone = "${var.availability_zone}"
  elb_name = "${var.elb_name}"
}


