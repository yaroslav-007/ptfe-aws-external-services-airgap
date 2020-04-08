module "vpc" {
  source = "./modules/vpc/"
}

module "s3" {
  source                 = "./modules/s3/"
  aws_s3_bucket_tag_name = var.aws_s3_bucket_tag_name
}

module "db" {
  source                = "./modules/db/"
  aws_availability_zone = var.aws_availability_zone
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password

}

module "r53" {
  source = "./modules/r53/"
}
