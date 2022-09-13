variable "region" {
  type = string
  default = "eu-west-1"
}

variable "prefix" {
  type = string
  default = "Development"
}

variable "security_group" {
  type = string
  default = "sg-08bcb1fac6e69efc8"
}

variable "subnet_id" {
  type = string
  default = "subnet-056c0bdb8c94ac28e"
}

variable "iam_instance_profile" {
  type = string
  default = "EC2InstanceProfile"
}

variable vpc_id {
  type    = string
  default = "vpc-0e09ba17db364c0d2"
}
