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
resource "aws_subnet" "newpublic_subnet" {
  vpc_id                  = aws_vpc.my_newvpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# Create Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_newvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.newpublic_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Launch EC2 instance
resource "aws_instance" "my_ec2_instance" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  subnet_id       = aws_subnet.newpublic_subnet.id
  key_name        = var.ec2_key_pair_name  # Use key pair name here
  tags = {
    Name = var.ec2_instance_name
  }
}
