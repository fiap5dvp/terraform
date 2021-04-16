resource "aws_network_interface" "vpn" {
  count     = var.vpn_num_instances
  subnet_id = element(list(aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id), count.index)

}

resource "aws_network_interface_sg_attachment" "eni-vpn-sg-att" {
  security_group_id    = aws_security_group.vpn_sg.id
  network_interface_id = aws_network_interface.vpn.id
}


resource "aws_eip" "eip_vpn" {
  network_interface = aws_network_interface.vpn.id
  vpc               = "true"
}
