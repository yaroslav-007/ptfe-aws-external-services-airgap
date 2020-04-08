###Creating EC2 instance for the tfe 
resource "aws_instance" "tfe" {
  ami                    = var.tfe-ami
  instance_type          = var.instance-type
  subnet_id              = aws_subnet.tfe-vpc-tfe-subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ssh-key.id
  tags = {
    Name = "tfe"
  }
  availability_zone = "eu-west-2a"
  private_ip        = "10.0.0.161"

  ###Install script to be executed after instance is up
  user_data = <<-EOF
		#! /bin/bash
    pushd  /home/ubuntu/tfe-ec2/replicated
    sudo bash ./install.sh airgap private-address=10.0.0.161

	EOF
}

###Create ssh public ssh key in tfe-server.tf
resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.ssh-public-key
}
