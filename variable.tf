variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "192.168.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "192.168.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  default     = "us-west-2a"
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0a70b9d193ae8a799" # Replace with your desired AMI ID
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "ec2_instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "MyEC2Instance"
}
