resource "aws_autoscaling_group" "asg" {
  name_prefix          = "${var.cluster_name}-${var.node_name}"
  termination_policies = ["OldestInstance"]
  max_size             = var.max_instances
  min_size             = var.min_instances
  launch_configuration = aws_launch_configuration.launch_config.name
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier = [
    var.subnet_id_master
  ]

  service_linked_role_arn = var.autoscaling_role

  tag {
    key                 = "Name"
    value               = var.cluster_name
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = true
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/k8s.io/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/nodeType"
    value               = "onDemand"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
