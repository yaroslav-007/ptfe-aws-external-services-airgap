###Output of the IP of Load balancer
output "elastip-ip" {
  value = aws_eip.ptfe-eip.public_ip
}

###DB Address
output "db_hosname" {
  value = aws_db_instance.ptfe-db.address
}