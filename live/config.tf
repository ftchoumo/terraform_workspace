terraform {
  backend "s3" {
    bucket = "statefileterraform"
    key    =  "allstates/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


locals {
  env = "${terraform.workspace}"
}


module "compute" {
region = "us-east-1"
source                      = "../modules/compute/ec2"

vpc_name                    = "demo_vpc"
#ec2_name                    = "prod-instance"
ec2_name                    = "${local.env}-instance"
ami_id                      = "ami-09e67e426f25ce0d7"
instance_type               = "t2.micro"
subnet_cidr                 = "10.0.1.0/24"
subnet_name                 = "demo-pub-sn-001"
availability_zone           = "us-east-1a"
cidr_block                  = "10.0.0.0/16"
instance_tenancy            = "default"
key_name                    = "dailytesting"

 # default     = "ami-09e67e426f25ce0d7" # ubuntu
 # default     = "ami-0ab4d1e9cf9a1215a" # linux
}

output "instance" {
  value = module.compute.ec2_values

}
