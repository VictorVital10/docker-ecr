# EC2 instance.

resource "aws_instance" "vav-instance" {
  ami = "ami-08dd439af9c3f1639"
  instance_type = "t3.micro"
  key_name = "vav-kp"

  tags = {
    Name = "VAV-Instance"
    Provisioned = "Terraform"
  }
}

# Key Pair SSH.

resource "aws_key_pair" "vav-kp" {
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