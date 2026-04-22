resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_1
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_2
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_app_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_app_1
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private_app_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_app_2
  availability_zone = "ap-south-1b"
}

resource "aws_subnet" "private_db_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_db_1
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private_db_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_db_2
  availability_zone = "ap-south-1b"
}
