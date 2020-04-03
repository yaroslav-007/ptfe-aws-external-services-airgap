###Creating S3 bucket for the PTFE
resource "aws_s3_bucket" "ptfe-bucket" {
  bucket = "ptfe-bucket"
  acl    = "private"
  region = "eu-west-2"
  tags = {
    Name = "ptfe-bucket"
  }
}


###Setting up access policies 
resource "aws_s3_bucket_public_access_block" "ptfe-bucket" {
  bucket                  = aws_s3_bucket.ptfe-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}