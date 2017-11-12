/*
This file uses environment varialbes for the access and secret keys.
The ami image is the free tier Unbunti 16.04 AMI.
*/

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/tmonte/.aws/credentials"
}

# Create a VPC
module "vpc" {
  name = "sparknet"
  cidr = "10.0.0.0/16"
  public_subnet = "10.1.1.0/24"
}


# Sets up the base instance
resource "aws_instance" "base" { 
  ami = "ami-da05a4a0" 
  instance_type = "t2.micro"
}

#resource "sparkmaster" "base" {
#  instance = "${aws_instance.base.id}"
#}  
