resource "aws_vpc" "local" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "localstack-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.local.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "localstack-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.local.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "localstack-public-b"
  }
}

resource "aws_security_group" "alb" {
  name        = "localstack-alb-sg"
  description = "Security group for LocalStack ALB"
  vpc_id      = aws_vpc.local.id

  ingress {
    description = "HTTP local"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound local"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "localstack-alb-sg"
  }
}
