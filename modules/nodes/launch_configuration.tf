resource "aws_launch_configuration" "launch_config" {
  name_prefix                 = "${var.cluster_name}-${var.node_name}-launch-config"
  image_id                    = data.aws_ami.ami.id
  instance_type               = var.instance_type
  security_groups             = ["sg-0b62a440e104e0833"]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = base64encode(data.template_file.container_instance_base_cloud_config.rendered)
  iam_instance_profile        = aws_iam_instance_profile.node-group-instance-role.name

  root_block_device {
    volume_type = "gp2"
    volume_size = var.volume_size
  }
}
