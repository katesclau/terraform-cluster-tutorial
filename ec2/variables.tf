
variable "region" {} 
variable "availability_zone" { }

variable "cluster_name" {}

variable "load_balancer" {}

variable "ami" {} 
variable "instance_type" { default = "t2.micro" }
variable "key_pair_name" {}

variable "cluster_min_size" { default = 1 }
variable "cluster_max_size" { default = 4 }
variable "cluster_size" { default = 2 }

variable "high_threshold" {}
variable "low_threshold" {}
