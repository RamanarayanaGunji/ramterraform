/* resource "aws-vpc" "main_v1" {
cidr_block="10.0.0.0/16"
tags= {
 Name="rama_vpc_v1"
 }
} */

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags ={
   Name = "rama-vpc_v1"
  }
}

resource "aws_internet_gateway" "rigw" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "ramIGW"
  }
}

resource "aws_subnet" "rsubnet_public1" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.1.0/16"

  tags = var.user_name
}

/* resource "aws_subnet" "rsubnet_private_v1" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.2.0/16"

  tags = var.user_name
}

*/

resource "aws_route_table" "ram_routetable_v1" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.rigw.id
  }

  tags = {
    Name = "ram_route_table_v1_main"
  }
}

resource "aws_route_table_association" "connet_rt_sn" {
  subnet_id      = aws_subnet.rigw.id
  route_table_id = aws_route_table.ram_routetable_v1.id
}

