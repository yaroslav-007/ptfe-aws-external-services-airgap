###AWS Credentials for aws-credentials.tf
variable "ptfe-ami" {
  type = string
  default = "<enter ami that packer will generate>"
}

variable "aws_access_key" {
  type = string
  default = "<enter aws access key>"
}
variable "aws_secret_key" {
  type = string
  default = "<enter aws secret key>"
}

###DB user name and credentials for database.tf
variable "db_name" {
  type = string
  default = "<enter db name>"
}

variable "db_username" {
  type = string
  default = "<enter db username>"
}

variable "db_password" {
  type = string
  default = "<enter db password>"
}

###SSH Public key in ptfe-server.tf
variable "ssh-public-key" {
  type = string
  default = "<enter public ssh key>"
}


###Route53 variables in route53.tf
variable "r53-zone-id" {
  type = string
  default = "<enter zone id>"
}
variable "domain-name" {
  type = string
  default = "<enter domain name>"
}

variable "db-domain-name" {
  type = string
  default = "<enter db hostname for cname address>"
}