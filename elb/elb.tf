resource "aws_elb" "classic_elb" {

  name = "${var.elb_name}"

  internal = "${var.internal}"
  availability_zones = ["${var.availability_zone}"]

  idle_timeout = "${var.idle_timeout}"
  connection_draining = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  # Added this SSL entry point
  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${aws_iam_server_certificate.tutorial_cert.arn}"
  }

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

resource "aws_iam_server_certificate" "tutorial_cert" {
  name_prefix      = "${var.elb_name}-cert"
  certificate_body = "${var.cert_file}"
  private_key      = "${var.key_file}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_app_cookie_stickiness_policy" "ssl_app_stickiness" {
  name = "${var.elb_name}-ssl-stickiness"
  load_balancer = "${aws_elb.classic_elb.id}"
  lb_port = 443
  cookie_name = "${var.session_cookie}"
}

resource "aws_lb_cookie_stickiness_policy" "lb_stickiness" {
  name = "${var.elb_name}-stickiness"
  load_balancer = "${aws_elb.classic_elb.id}"
  lb_port = 80
  cookie_expiration_period = 600
}

output "elb_name" { value = "${aws_elb.classic_elb.name}" }

output "elb_dns" { value = "${aws_elb.classic_elb.dns_name}" }

output "elb_zone_id" { value = "${aws_elb.classic_elb.zone_id}" }
