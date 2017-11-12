provider "aws" {
  shared_credentials_file = "/home/tmonte/.aws/credentials"
  region     = "us-east-1"
}

# requires that the subnet already exists
resource "aws_instance" "base" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
  subnet_id = "subnet-a1d26cea"
}
