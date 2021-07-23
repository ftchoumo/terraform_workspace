
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr 

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_instance" "ec2" {
  ami               = var.ami_id
  instance_type     = var.instance_type
//  availability_zone = var.availability_zone
  subnet_id         = aws_subnet.main.id

  // dynamically retrieve SSH Key Name
  //key_name  = aws_key_pair.ec2.key_name
  key_name  = var.key_name
  

  // dynamically set Security Group ID (firewall)
  //vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "${var.ec2_name}-demo"
  }
}

/*
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

*/

