resource "aws_subnet" "priv_sub_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "my-private-subnet-1"
  }
}