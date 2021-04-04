variable "aws_region" {}

variable "dns_enable" {
  default = true
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnets_cidr" {
  type = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  type = "list"
  default = ["us-east-1a", "us-east-1b","us-east-1c", "us-east-1d"]
}

variable "webservers_ami" {
  default = "ami-0742b4e673072066f"
}

variable "instance_type" {
  default = "t2.micro"
}






