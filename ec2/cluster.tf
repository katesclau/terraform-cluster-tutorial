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

# Policy and Alarm for high usage
resource "aws_autoscaling_policy" "up_policy" {
  name = "${var.cluster_name}-up-policy"

  scaling_adjustment = 1
  
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "high" {
  alarm_name = "terraform-test-foobar5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "${var.high_threshold}"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_description = "High CPU utilization on ${var.cluster_name} cluster"
  alarm_actions = ["${aws_autoscaling_policy.up_policy.arn}"]
}

# Policy and Alarm for low usage
resource "aws_autoscaling_policy" "down_policy" {
  name = "${var.cluster_name}-down-policy"

  scaling_adjustment = -1
  
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "low" {
  alarm_name = "terraform-test-foobar5"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "${var.low_threshold}"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.asg.name}"
  }

  alarm_description = "Low CPU utilization on ${var.cluster_name} cluster"
  alarm_actions = ["${aws_autoscaling_policy.down_policy.arn}"]
}
