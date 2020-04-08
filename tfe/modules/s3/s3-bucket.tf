###Creating S3 bucket for the tfe
resource "aws_s3_bucket" "tfe-bucket" {
  bucket = "tfe-bucket"
  acl    = "private"
  region = "eu-west-2"
  tags = {
    Name = var.aws_s3_bucket_tag_name
  }
}

###Setting up access policies 
resource "aws_s3_bucket_public_access_block" "tfe-bucket" {
  bucket                  = aws_s3_bucket.tfe-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}