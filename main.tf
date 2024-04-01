provider "aws" {
  region = var.aws_region
}

# Define VPC
resource "aws_vpc" "my_newvpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_newvpc.id
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_newvpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}


# Launch EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  subnet_id       = aws_subnet.public_subnet.id
  tags = {
    Name = var.ec2_instance_name
  }
}
