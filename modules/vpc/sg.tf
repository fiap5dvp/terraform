resource "aws_security_group" "vpn_sg" {
  name        = "VPN SG"
  description = "Permit network traffic to VPN"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 15153
    to_port     = 15153
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9756
    to_port     = 9756
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}", "${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}", "${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}", "${chomp(data.http.myip.body)}/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}", "${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound"
  }
}
