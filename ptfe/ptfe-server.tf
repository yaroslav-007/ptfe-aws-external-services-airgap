###Creating EC2 instancce for the ptfe 
resource "aws_instance" "ptfe" {
  ami                    = var.ptfe-ami
  instance_type          = "t2.xlarge"
  subnet_id              = aws_subnet.ptfe-vpc-ptfe-subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id] 
  key_name               = aws_key_pair.ssh-key.id                     
  tags = {
    Name = "ptfe"
  }
  availability_zone = "eu-west-2a"
  private_ip = "10.0.0.161"

###Install script to be executed after instance is up
  user_data = <<-EOF
		#! /bin/bash
    pushd  /home/ubuntu/ptfe-ec2/replicated
    sudo nohup bash ./install.sh airgap private-address=10.0.0.161

	EOF
}

###Create ssh public ssh key in ptfe-server.tf
resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.ssh-public-key
}