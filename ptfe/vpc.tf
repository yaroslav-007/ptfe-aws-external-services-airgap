####Create PTFE VPC for the project
resource "aws_vpc" "ptfe-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ptfe-vpc"
  }
}

# Create elastic ip to set static ip for the network load balancer
resource "aws_eip" "ptfe-eip" {
  vpc = true
  tags = {
    Name = " ptfe-eip"
  }
}