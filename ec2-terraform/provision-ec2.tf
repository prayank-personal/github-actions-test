//########################### Common
data "aws_region" "Region" {

}

locals {
  vpc_name = "${var.prefix}-VPC"
}


####### VM Image to be used 

data "aws_ami" "amazon-linux-2" {
  most_recent = true
filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2*"]
  }
filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
owners = ["amazon"]
}



resource "aws_instance" "GithubActions" {
  ami           = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "${var.ec2_instance_type}"
  
  availability_zone ="${data.aws_region.Region.name}a"
  vpc_security_group_ids = [
    "${var.security_group}",
  ]
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true  
  
  iam_instance_profile = "${var.iam_instance_profile}"
  key_name = "GithubActions"
  
  disable_api_termination = "false"
  
   root_block_device {
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = "false"
	tags = {
              Name = "Github Actions EC2 Volume"
             }
  }
  
  tags = {
		"Environment" = "${var.prefix}"
		"Scope"       = "devops"
		"Name" = "GithubActions-ec2"
		}  
  
  
}
