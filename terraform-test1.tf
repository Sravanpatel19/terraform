provider "aws" {
  region     = "us-east-1"
  access_key = "xxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "yyyyyyyyyyyyyyyyyyyyyyy"
}
resource "aws_vpc" "grocery" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "grocery"
  }
}
resource "aws_subnet" "web-subnet" {
  vpc_id     = aws_vpc.grocery.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "web-subnet"
  }
}
resource "aws_subnet" "app-subnet" {
  vpc_id     = aws_vpc.grocery.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "app-subnet"
  }
}
resource "aws_internet_gateway" "grocery-igw" {
  vpc_id = aws_vpc.grocery.id

  tags = {
    Name = "grocery-igw"
  }
}
