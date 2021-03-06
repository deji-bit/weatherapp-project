### Create our VPC ###

resource "aws_vpc" "thirdvpc" {
  cidr_block       = "10.0.0.0/24"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"

  tags = {
    Name = "weatherapp-vpc"
  }
}

### Create our Internet Gateway ###

resource "aws_internet_gateway" "thirdigw" {
  vpc_id = aws_vpc.thirdvpc.id
  
  tags = {
    Name = "weatherapp-igw"
  }
}

### Create a Route Table to be used by our Internet Gateway ###

resource "aws_route_table" "thirdrtb" {
  vpc_id = aws_vpc.thirdvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.thirdigw.id
  }

  tags = {
    Name = "weatherapp-rtb"
  }
}


### Create the Subnets to launch our Jenkins node in ###

resource "aws_subnet" "thirdsubneta" {
  vpc_id = aws_vpc.thirdvpc.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "weather-jenkins-subnet-a"
  }
}


### Associate our Route Table to the Public Subnet for our Jenkins node ###

resource "aws_route_table_association" "thirdrtbassa" {
  subnet_id      = aws_subnet.thirdsubneta.id
  route_table_id = aws_route_table.thirdrtb.id
}
