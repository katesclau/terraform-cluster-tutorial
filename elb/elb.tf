resource "aws_elb" "classic_elb" {

  name = "${var.elb_name}"

  internal = "${var.internal}"
  availability_zones = ["${var.availability_zone}"]

  idle_timeout = "${var.idle_timeout}"
  connection_draining = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

 listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }
  
   health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 29
    target              = "HTTP:8080/"
    interval            = 30
  }
}

output "elb_name" { value = "${aws_elb.classic_elb.name}" }

output "elb_dns" { value = "${aws_elb.classic_elb.dns_name}" }

output "elb_zone_id" { value = "${aws_elb.classic_elb.zone_id}" }
