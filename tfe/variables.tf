variable "aws_access_key" {
  description = "###AWS Credentials for aws-credentials.tf"
  type        = string
}

variable "aws_secret_key" {
  description = ""
  type        = string
}

variable "aws_availability_zone" {
  description = ""
  type        = string
}

variable "aws_s3_bucket_tag_name" {
  description = ""
  type        = string
}

variable "aws_db_subnet_group_tag_name" {
  description = ""
  type        = string
}

variable "vpc_cidr_block" {
  description = ""
  type        = string
}

variable "tfe-ami" {
  description = "###PTFE instance "
  type        = string
}

variable "instance-type" {
  description = ""
  type        = string
  default     = "t2.xlarge"
}

variable "db_name" {
  description = "###DB user name and credentials for database.tf"
  type        = string
}

variable "db_username" {
  description = ""
  type        = string
}

variable "db_password" {
  description = ""
  type        = string
}

variable "ssh-public-key" {
  description = "###SSH Public key in tfe-server.tf"
  type        = string
}

variable "r53-zone-id" {
  default = "###Route53 variables in route53.tf"
  type    = string
}

variable "domain-name" {
  description = ""
  type        = string
}

variable "db-domain-name" {
  description = ""
  type        = string
}
