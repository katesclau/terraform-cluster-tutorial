resource "aws_efs_file_system" "filesystem" {
  creation_token = "${var.efs_name}"
}

resource "aws_efs_mount_target" "fs_target" {
  file_system_id = "${aws_efs_file_system.filesystem.id}"
  subnet_id = "${var.subnet_id}"
  security_groups = ["${var.vpc_sg_ids}"]
}

output "efs_id" { value = "${aws_efs_file_system.filesystem.id}" }
output "net_id" { value = "${aws_efs_file_system.filesystem.network_interface_id}" }
