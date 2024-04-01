variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  
}

variable "ec2_instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  
}
