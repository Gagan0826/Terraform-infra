resource "aws_vpc" "my_vpc" {
  cidr_block = "194.0.0.0/16"  
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.my_public_subnet.id
}

resource "aws_eip" "my_eip" {
  vpc = true
}