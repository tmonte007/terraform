
provider "aws" {
  shared_credentials_file = "/home/tmonte/.aws/credentials"
  region     = "us-east-1"
}

# If the name is not unique, you will get an error.
resource "aws_s3_bucket" "tmonteS3" {
  bucket = "tmonte-terraform-s3"
  acl    = "private"

  tags {
    Name        = "tmonteS3bucket"
    Environment = "Dev"
  }
}
