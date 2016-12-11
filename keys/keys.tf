
resource "aws_key_pair" "aws_access" {
  key_name = "${var.key_pair_name}"
  public_key = "${var.public_key}"
}

output "key_name" { value = "${aws_key_pair.aws_access.key_name}" }

