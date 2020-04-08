###Output of the IP of Load balancer
output "elastip-ip" {
  value = aws_eip.tfe-eip.public_ip
}

###DB Address
output "db_hosname" {
  value = aws_db_instance.tfe-db.address
}
