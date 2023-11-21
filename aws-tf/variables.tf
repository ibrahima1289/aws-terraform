# Define variables

# For network
# Availability Zone
variable "ec2_az" {
  type        = string
  description = "AWS Availability Zone"
  default     = "us-east-1a"
}
# VPC Variables
variable "ec2_vpc_cidr" {
  type        = string
  description = "CIDR for VPC"
  default     = "10.0.0.0/25"
}
# Subnet Variables
variable "ec2_public_subnet_cidr" {
  type        = string
  description = "CIDR for public subnet"
  default     = "10.0.0.0/26"
}

# For VM
variable "ec2_server_type" {
  type        = string
  description = "EC2 type for Ubuntu Linux Server"
  default     = "t2.micro"
}

variable "ec2_server_ami" {
  type        = string
  description = "EC2 Ubuntu AMI"
  default     = "ami-000b3a073fc20e415"
}

variable "ec2_server_public_ip" {
  type        = bool
  description = "Associate,public IP to EC2"
  default     = true
}
