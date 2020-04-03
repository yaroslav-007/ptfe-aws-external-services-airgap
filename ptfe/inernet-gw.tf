# Create Internet GW  within VPC
resource "aws_internet_gateway" "ptfe-vpc-internet-gw" {
  vpc_id = aws_vpc.ptfe-vpc.id

  tags = {
    Name = "ptfe-vpc-internet-gw"
  }
}

# Create route table and route for Internet  for the PTFE instance (private) subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ptfe-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ptfe-vpc-internet-gw.id
  }

  tags = {
    Name = "ptfe-public-route-table"
  }
}

# Assosiate route table with the Public Subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.ptfe-vpc-ptfe-subnet.id
  route_table_id = aws_route_table.public.id
}