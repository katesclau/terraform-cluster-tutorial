# Network & Region
variable "vpc_sg_ids" {}
variable "sg_name" {}
variable "db_multi_az" { default = "false" }
variable "public" { default = "false" }

# Name
variable "rds_name" {}

# Instance class
variable "db_instance_class" { default = "db.t2.micro" } # Free tier

# Storage
variable "db_storage" { default = 20 } # Free tier max
variable "db_storage_type" { default = "standard" } # Free tier

# DB Engine 
variable "db_engine" { default = "mariadb" }
variable "db_engine_version" { default = "10.0.24" }

# Database configuration
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_port" { default = 3306 }

# Backup config
variable "backup_retention_period" { default = 7 }
variable "maintenance_window" { default = "tue:10:33-tue:11:03" }
variable "backup_window" { default = "09:19-10:10" }

