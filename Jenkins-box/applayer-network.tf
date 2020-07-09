
### Create the Subnets to launch our app nodes in ###

resource "aws_subnet" "thirdsubnetb" {
  vpc_id = aws_vpc.thirdvpc.id
  cidr_block = "10.0.0.64/26"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "weatherapp-subnet-b"
  }
}

resource "aws_subnet" "thirdsubnetc" {
  vpc_id = aws_vpc.thirdvpc.id
  cidr_block = "10.0.0.128/26"
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "weatherapp-subnet-c"
  }
}

### Create the Subnets to launch our Nginx node in ###

resource "aws_subnet" "thirdsubnetd" {
  vpc_id = aws_vpc.thirdvpc.id
  cidr_block = "10.0.0.192/26"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "nginx-proxy-subnet-d"
  }
}

### Associate our Route Table to the Public Subnets for our Nginx node ###

resource "aws_route_table_association" "thirdrtbassd" {
  subnet_id      = aws_subnet.thirdsubnetd.id
  route_table_id = aws_route_table.thirdrtb.id
}
