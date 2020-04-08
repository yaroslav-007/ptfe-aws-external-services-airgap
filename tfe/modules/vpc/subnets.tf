###Private Subnet for tfe ec2 instance
resource "aws_subnet" "tfe-vpc-tfe-subnet" {
  vpc_id                  = aws_vpc.tfe-vpc.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "tfe-vpc-public-subnet"
  }
}

###Two private subnets that will be consume from db subnet group. They should be in different availability zones
resource "aws_subnet" "tfe-vpc-db1-subnet" {
  vpc_id                  = aws_vpc.tfe-vpc.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2b"
  tags = {
    Name = "tfe-vpc-db-subnet"
  }
}

resource "aws_subnet" "tfe-vpc-db2-subnet" {
  vpc_id                  = aws_vpc.tfe-vpc.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "tfe-vpc-db-subnet"
  }
}
