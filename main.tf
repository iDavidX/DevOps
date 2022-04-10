
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
# Create a VPC
resource "aws_vpc" "iDavid" {
  cidr_block = "125.123.0.0/16"
  tags = {
    Name = "iDavid-vpc"
  }
}
# Create webSubnet
resource "aws_subnet" "webSubnet" {
  vpc_id = aws_vpc.iDavid.id
  cidr_block = "125.123.1.0/27"
  tags={
      Name = "classic Web"
  }
}
resource "aws_subnet" "appSubnet" {
  vpc_id = aws_vpc.iDavid.id
  cidr_block = "125.123.1.32/27"
  tags={
      Name = "app subnet web"
  }
}
resource "aws_subnet" "dataBase" {
  vpc_id = aws_vpc.iDavid.id
  cidr_block = "125.123.1.64/28"
  tags={
      Name = "dataBase subnet web"
  }
}