# EC2 instance.

resource "aws_instance" "vav-instance" {
  ami = "ami-08dd439af9c3f1639"
  instance_type = "t3.micro"
  key_name = "vav-kp"
  vpc_security_group_ids = [aws_security_group.vav-sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name

  tags = {
    Name = "VAV-Instance"
    Provisioned = "Terraform"
  }
}

# Key Pair SSH.

resource "aws_key_pair" "vav-kp-" {
    key_name = "vav-kp"
    public_key = file("C:/Users/Vitor Vital/.SSH/VAV-Instance/PUBK")
}

# Security Group

resource "aws_security_group" "vav-sg" {
  name = "vav-sg"
  description = ""
  vpc_id = "vpc-05e50bc6601329573"
  
  tags = {
    Provisioned = "Terraform"
  }
}

# Ingress Rule

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.vav-sg.id
  cidr_ipv4         = "192.168.0.3/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.vav-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow-https" {
  security_group_id = aws_security_group.vav-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# Egress Rule

resource "aws_vpc_security_group_egress_rule" "allow-all-outbound" {
  security_group_id = aws_security_group.vav-sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}
