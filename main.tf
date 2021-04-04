module "stack-europe" {
  source = "./modules/stack"
  aws_region = "eu-west-1"
  vpc_cidr = "10.0.0.0/16"
  subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
  azs = ["eu-west-1a", "eu-west-1b","eu-west-1c"]
  webservers_ami = "ami-0ffea00000f287d30"
  instance_type = "t2.micro"

}


# By default it will be creating VPC and 4 public SNs and EC2 instances in US with the ELB
module "stack_us" {
  source = "./modules/stack"
  aws_region = "us-east-1"
}


