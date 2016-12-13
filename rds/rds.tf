resource "aws_db_instance" "database" {
  identifier = "${var.rds_name}"

  # Network configuration
  vpc_security_group_ids = ["${var.vpc_sg_ids}"]
  db_subnet_group_name = "${var.sg_name}"
  
  # DB Engine 
  engine = "${var.db_engine}"
  engine_version = "${var.db_engine_version}"

  # Instance class
  instance_class = "${var.db_instance_class}"

  # Storage
  allocated_storage = "${var.db_storage}"
  storage_type = "${var.db_storage_type}"

  # Database configuration
  name = "${var.db_name}"
  username = "${var.db_user}"
  password = "${var.db_password}"
  multi_az = "${var.db_multi_az}" 
  port = "${var.db_port}"

  # Public IP?
  publicly_accessible = "${var.public}"

  # Backup config
  backup_retention_period = "${var.backup_retention_period}"
  maintenance_window = "${var.maintenance_window}"
  backup_window = "${var.backup_window}"
}

output "database_name" {
  value = "${aws_db_instance.database.name}"
}
output "username" {
  value = "${aws_db_instance.database.username}"
}
output "password" {
  sensitive = true # Keep it a secret
  value = "${var.db_password}"
}
output "database_address" {
  value = "${aws_db_instance.database.address}"
}
output "database_endpoint" {
  value = "${aws_db_instance.database.endpoint}"
}
