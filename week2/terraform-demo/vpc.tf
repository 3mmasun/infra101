resource "aws_vpc" "infra_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  tags = {
    Name = "main"
  }
}

# public subnet
resource "aws_subnet" "infra_public" {
  vpc_id                  = "${aws_vpc.infra_vpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "infra-public"
  }
}

# private subnet
resource "aws_subnet" "infra_private" {
  vpc_id                  = "${aws_vpc.infra_vpc.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "infra-private"
  }
}

# internet gateway
resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = "${aws_vpc.infra_vpc.id}"
  tags = {
    name = "main"
  }
}

# route table
resource "aws_route_table" "infra_public" {
  vpc_id = "${aws_vpc.infra_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc_gw.id}"
  }
}

# associate route table with the public subnet
resource "aws_route_table_association" "infra_public" {
  subnet_id      = "${aws_subnet.infra_public.id}"
  route_table_id = "${aws_route_table.infra_public.id}"
}
