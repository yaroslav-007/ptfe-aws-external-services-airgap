###Create  DB instance fot PTFE
resource "aws_db_instance" "ptfe-db" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "11.6"
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  deletion_protection    = false
  availability_zone      = "eu-west-2a"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.id
  vpc_security_group_ids = [aws_security_group.ptfe-db-sg.id]
}

###Create DB sunet groups
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.ptfe-vpc-db1-subnet.id, aws_subnet.ptfe-vpc-db2-subnet.id]

  tags = {
    Name = "PTFE DB subnet group"
  }
}