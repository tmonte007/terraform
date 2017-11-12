provider "aws" {
  shared_credentials_file = "/home/tmonte/.aws/credentials"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "tmonteS3" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags {
    Name        = "S3bucket"
    Environment = "Dev"
  }
}
