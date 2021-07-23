variable "ami_id" {
  type        = string
  description = "AMI ID to use"
}

variable "instance_type" {
  type        = string
  description = "Instance type to use"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone to use"
}

variable "cidr_block" {
  type        = string
  description = "cidr block to use"
}

variable "instance_tenancy" {
  type        = string
  description = "instance tenancy to use"
}

variable "vpc_name" {
  type        = string
  description = "vpc name to use"
}

variable "ec2_name" {
  type        = string
  description = "ec2 name to use"
}

variable "subnet_cidr" {
  type        = string
  description = "subnet cidr to use"
}

variable "subnet_name" {
  type        = string
  description = "subnet name to use"
}

variable "key_name" {
    type        = string
  description = "the ssh key name"
}

variable "region" {
    type        = string
  description = "the ssh key name"
}
