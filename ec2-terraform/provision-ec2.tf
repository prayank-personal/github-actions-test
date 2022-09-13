# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "ubuntu" {
    most_recent = true
filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }
filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_region" "Region" {

}

locals {
  vpc_name = "Development-VPC"
}


# provision to eu-west-1 region
provider "aws" {
  region  = "eu-west-1"
}
resource "aws_instance" "GithubActionsEC2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "GithubActions"
tags = {
    Name = "GithubActionsEC2"
  }
}
