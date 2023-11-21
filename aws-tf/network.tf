# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.ec2_vpc_cidr
  enable_dns_hostnames = true
}

# Define the public subnet
resource "aws_subnet" "ec2-public-subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.ec2_public_subnet_cidr
  availability_zone = var.ec2_az
}

# Define the internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Define the public route table
resource "aws_route_table" "ec2-public-rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Assign the public route table to the public subnet
resource "aws_route_table_association" "ec2-public-rt-association" {
  subnet_id      = aws_subnet.ec2-public-subnet.id
  route_table_id = aws_route_table.ec2-public-rt.id
}