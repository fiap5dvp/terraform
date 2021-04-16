resource "aws_instance" "vpn" {
  count                  = var.vpn_num_instances
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type_vpn
  subnet_id              = element(list(aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id), count.index)
  ebs_optimized          = true
  monitoring             = false
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.vpn_sg.id]
  source_dest_check      = true
  network_interface = {
    network_interface_id = aws_network_interface.vpn.id
    device_index         = 0
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = true
  }

  tags = {
    Environment = "${var.env}"
    Name        = "${var.hostname_vpn}${format("%02d", count.index + 1)}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${var.key_file}")
    host        = aws_eip.eip_vpn.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.hostname_vpn}}-${format("%02d", count.index + 1)}",
      "sudo echo '${var.hostname_vpn}-${format("%02d", count.index + 1)}' > /etc/hostname",
      "echo '127.0.0.1 ${var.hostname_vpn}-${format("%02d", count.index + 1)}' | sudo tee -a /etc/hosts",
      "sudo apt update -y && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y",
    ]
  }

  provisioner "local-exec" {
    command = "sleep 10; ansible-playbook -i '${aws_eip.eip_vpn.public_ip},' --ssh-common-args='-o StrictHostKeyChecking=no' --user=ubuntu --private-key='${var.key_file}' ${var.vpn_playbook}"
  }
}
