####Create tfe VPC for the project
resource "aws_vpc" "tfe-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "tfe-vpc"
  }
}

# Create elastic ip to set static ip for the network load balancer
resource "aws_eip" "tfe-eip" {
  vpc = true
  tags = {
    Name = " tfe-eip"
  }
}