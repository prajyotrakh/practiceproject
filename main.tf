provider "aws" {
  region = "us-east-1"  # Modify this to your desired AWS region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Change the CIDR block to your desired VPC IP range
}

resource "aws_subnet" "public_subnet" {
  count = 1
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"  # Change the CIDR block as needed
  availability_zone = "us-east-1a"  # Modify the availability zone as needed
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count = 1
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"  # Change the CIDR block as needed
  availability_zone = "us-east-1b"  # Modify the availability zone as needed
}

resource "aws_security_group" "allow_all" {
  name_prefix = "allow_all_"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "vpc_id"{
value = aws_vpc.my_vpc.id
}
