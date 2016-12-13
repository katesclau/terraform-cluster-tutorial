# Auto Scaling Pool
resource "aws_autoscaling_group" "asg" {

  name = "${var.cluster_name}-asg"

  availability_zones = ["${var.availability_zone}"]

  min_size = "${var.cluster_min_size}"
  max_size = "${var.cluster_max_size}"
  desired_capacity = "${var.cluster_size}"
  
  load_balancers = ["${var.load_balancer}"]

  # here we link the launch configuration below
  launch_configuration = "${aws_launch_configuration.asg_pool.name}"
}

# Instances Launch Configuration
resource "aws_launch_configuration" "asg_pool" {
  # use system generated name to allow changes of launch_configuration
  name_prefix = "${var.cluster_name}-asg-"

  # From our base instance configuration
  image_id = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_pair_name}"

  lifecycle { create_before_destroy = true }
}

