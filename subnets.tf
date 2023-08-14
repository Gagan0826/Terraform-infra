resource "aws_subnet" "my_public_subnet" {
  vpc_id              = aws_vpc.my_vpc.id
  cidr_block          = "194.0.0.0/24"
  availability_zone   = "ap-south-1a"

  tags = {
    Name = "my-public-subnet"
  }
}


resource "aws_subnet" "my_private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "194.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "my-private-subnet"
  }
}
resource "aws_subnet" "my_private_subnet-2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "194.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "my-private-subnet-2"
  }
}


resource "aws_db_subnet_group" "private_db_subnet_group" {
  name       = "private-db-subnet-group"
  subnet_ids = [aws_subnet.my_private_subnet.id,aws_subnet.my_private_subnet-2.id]
}