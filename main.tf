provider "aws" {
  region = "us-west-2" # Change this to your desired region
}

# Define VPC
resource "aws_vpc" "my_newvpc" {
  cidr_block           = "192.168.0.0/16"
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
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "us-west-2a" # Change this to your desired availability zone
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
